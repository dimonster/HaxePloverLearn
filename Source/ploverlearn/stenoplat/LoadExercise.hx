package ploverlearn.stenoplat;

import flash.net.URLRequest;
import flash.net.URLLoader;
import flash.events.Event;
import flash.display.Sprite;
import flash.display.LoaderInfo;
import flash.display.Loader;
import flash.errors.IOError;
import openfl.Lib;
import openfl.Assets;
import openfl.events.ErrorEvent;
import openfl.events.IOErrorEvent;
import ploverlearn.stenoplat.Exercise;
#if sys
	import sys.FileSystem;
	import sys.io.File;
#end

import openfl.errors.Error;
import flash.text.TextField;

using StringTools;

/**
 * ...
 * @author EN
 *
 * Load an exercise from a file in the format of Learn Plover! exercise solutions
 * (cut and pasted from Learn Plover! site into each lesson.txt)
 * into an Exercise object.
 *
 */

class LoadExercise extends Sprite
{
	private var onExerciseLoaded : Exercise->Void;
	private var fileName : String;
	private var randomise : Bool;
	private var repeatize : Bool;

	public function new(fileName:String, onExerciseLoaded:Exercise->Void)
	{
		super();

		this.onExerciseLoaded = onExerciseLoaded;
		this.fileName = fileName;
		this.randomise = Lib.current.loaderInfo.parameters.random == "true";
		this.repeatize = Lib.current.loaderInfo.parameters.repeat == "true";
	}

	public function load()
	{
		#if flash
			var loader : URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, myCompleteHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);

			try
			{
				loader.load(new URLRequest(fileName));
			}
			catch (e : Error)
			{
				onError(null);
			}
		#elseif (sys)
			var path = Sys.getCwd() + "assets/"+ fileName;
			trace("path = " + path);
			if (FileSystem.exists(path))
			{
				trace("exists");
				var asset = File.getContent(path);
				trace("asset = " + asset);
				if (AssetCache != null)
				{
					onExerciseLoaded(parseFile(asset));
				}
			}
		#end
	}

	private function onError(e : Event) : Void
	{
		if (Assets.exists("assets/" + fileName))
		{
			var asset = Assets.getText("assets/" + fileName);
			if (asset != null)
			{
				onExerciseLoaded(parseFile(asset));
			}
		}
		else
		{
			trace(e);
		}
	}

	private function myCompleteHandler(event : Event) : Void
	{
		var loader : URLLoader = cast (event.target);
		onExerciseLoaded(parseFile(loader.data));
	}

	private function parseFile(fileTxt : String) : Exercise
	{
		var lines : Array<String> = fileTxt.split("\n");
		var lessonTitle = noreturn(lines[0]);
		var exerciseName = noreturn(lines[1]);
		var words : Array<WordAndHint> = [];
		var settings : Array<Setting> = [];
		for (i in 2...lines.length)
		{
			var line : String = noreturn(lines[i]);
			var firstChar = line.charAt(0);

			if(firstChar == "'")
			{
				var wordAndHint : Array<String> = line.split("\': ");
				var word : String = wordAndHint[0];
				word = word.substring(1, word.length);
				var hint = wordAndHint[1];
				words.push( { word:word, hint:hint } );
			}
			else if(line.indexOf("=") != -1)
			{
				var varAndValue : Array<String> = line.split("=");
				var name = varAndValue[0];
				var value = varAndValue[1];
				settings.push( { name:name, value:value } );
			}
		}

	if(this.randomise) {
		words = this.shuffleArray(words);
	}

	if(this.repeatize) {
		words = this.shuffleArray(words);
	}

		return new Exercise(lessonTitle, exerciseName, words, settings);
	}

  /**
   * Randomize array element order in-place.
   * Using Durstenfeld shuffle algorithm.
   * http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
   */
  private function shuffleArray(array : Array<WordAndHint>) {
	var currentIndex = array.length, temporaryValue, randomIndex ;

	// While there remain elements to shuffle...
	while (0 != currentIndex) {

		// Pick a remaining element...
		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex -= 1;

		// And swap it with the current element.
		temporaryValue = array[currentIndex];
		array[currentIndex] = array[randomIndex];
		array[randomIndex] = temporaryValue;
	}

	return array;
  }



	private function noreturn(s : String) : String
	{
		return s.replace("\r","");
	}
}

typedef WordAndHint = {
	var word : String;
	var hint : String;
}

typedef Setting = {
	var name : String;
	var value : String;
}
