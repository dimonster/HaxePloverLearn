package ploverlearn.stenoplat;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.Bitmap;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author EN
 *
 * SplashScreen: The intro screen
 */

class SplashScreen extends Sprite
{
	private var header : String;
	private var subheader : String;
	private var info : String;
	private var button : Sprite;
	private var BUFFER : Int = 50;
	private var infoField : TextField;
	private var metricsField : TextField;
	private var metricsFieldValues : TextField;
	private var metricsDark : Bitmap;
	private var headerField : TextField;
	private var subheaderField : TextField;
	private var onHide : Void->Void;

	private var screenHeight:Float = 0;
	private var screenWidth:Float = 0;

	public function new(header : String, subheader : String, info : String, onHide : Void->Void)
	{
		super();

		this.header = header;
		this.subheader = subheader;
		this.info = info;
		this.onHide = onHide;
		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(e : Event = null) : Void
	{
		initBackground();

		headerField = new NiceTextField(header, 45, 0xffffff, 0.9);
		subheaderField = new NiceTextField(subheader, 25, 0xffffff, 0.9);
		infoField = new NiceTextField(info, 25, 0xffffff, 0.8);
		metricsField = new NiceTextField("A\nB\nC\nD\nE\n", 20, 0xffffff, 1.0, false, this.width/5, TextFormatAlign.LEFT);
		metricsFieldValues = new NiceTextField("A\nB\nC\nD\nE\n", 20, 0xffffff, 1.0, false, this.width/5, TextFormatAlign.RIGHT);

		metricsField.height = (20 * 6);
		metricsFieldValues.height = metricsField.height;

		metricsDark = new Bitmap(new BitmapData(1, 1, true, 0x70000000));

		headerField.width = this.width;
		headerField.height = 2 * headerField.textHeight + 10;
		headerField.wordWrap = true;
		headerField.x = 0;
		headerField.y = height / 3;

		subheaderField.width = this.width;
		subheaderField.height = 2 * subheaderField.textHeight + 10;
		subheaderField.wordWrap = true;
		subheaderField.x = 0;
		subheaderField.y = (height / 3) + headerField.textHeight;

		infoField.x = (width - infoField.width) / 2;
		infoField.y = 3 * height / 4;

		screenHeight = height;
		screenWidth = width;

		var ploverBitmap = new Bitmap(Assets.getBitmapData("assets/plover.jpg"));
		ploverBitmap.x = (screenWidth / 2) - (ploverBitmap.width / 2);
		this.addChild(ploverBitmap);

		this.addChild(infoField);
		this.addChild(headerField);
		this.addChild(subheaderField);
		this.addChild(metricsDark);
		this.addChild(metricsField);
		this.addChild(metricsFieldValues);

		metricsField.x = (width - metricsField.width) - ((width - ploverBitmap.width) / 2);
		metricsField.y = (height - metricsField.textHeight);

		metricsFieldValues.x = metricsField.x;
		metricsFieldValues.y = metricsField.y;

		metricsDark.width = metricsField.textWidth;
		metricsDark.height = metricsField.textHeight;
		metricsDark.x = metricsField.x;
		metricsDark.y = metricsField.y;

		metricsField.text = metricsFieldValues.text = "";

		addEventListener(MouseEvent.CLICK, buttonClick);

		this.visible = false;
	}

	public function setSubHeaderText(s : String)
	{
		subheaderField.text = s;
	}

	private function buttonClick(e : Event)
	{
		hide();
	}

	public function show(?m:Metrics)
	{
		this.visible = true;
		stage.focus = this.infoField;

		if (m != null)
		{
			metricsField.text =  "TIME:";
			metricsField.text += "\nWPM:";
			metricsField.text += "\nMisstrokes:";
			metricsField.text += "\nLast Streak:";
			metricsField.text += "\nBest Streak:";

			metricsFieldValues.text =  m.seconds + " sec.";
			metricsFieldValues.text += "\n"+m.wpm;
			metricsFieldValues.text += "\n"+m.misstrokes;
			metricsFieldValues.text += "\n"+m.streak;
			metricsFieldValues.text += "\n"+m.bestStreak;

			metricsField.y = screenHeight - metricsField.textHeight - 5;
			metricsFieldValues.y = metricsField.y;

			metricsDark.width = metricsField.width;
			metricsDark.height = metricsField.textHeight + 10;
			metricsDark.x = metricsField.x;
			metricsDark.y = metricsField.y;
			metricsDark.visible = true;
			metricsField.visible = true;
		}
		else
		{
			metricsField.visible = false;
			metricsDark.visible = false;
		}
	}

	public function hide()
	{
		this.visible = false;
		onHide();
	}

	private function initBackground()
	{
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 0, stage.stageWidth - BUFFER, stage.stageHeight - BUFFER);
		graphics.endFill();

		this.x = BUFFER / 2;
		this.y = BUFFER / 2;
	}
}

