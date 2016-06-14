HaxePloverLearn
===========

*a fork of [PloverLearn](https://github.com/larsiusprime/haxeploverlearn)*

Drills for the [Learn Plover! book](https://sites.google.com/site/ploverdoc/home).

Website: [di.id.au/plover/learn/](http://di.id.au/plover/learn/)



Building
========

1. Download & install [Haxe](http://haxe.org/download/):
    - Mac users:
      - Open the Installer.
      - Run `haxelib setup`.
        - Recommended Path: `/usr/local/lib/haxelib`.
2. Download & install [OpenFL](http://www.openfl.org/documentation/getting-started/installing-openfl/):
    - Run `haxelib install openfl`.
    - Run `haxelib run openfl setup`.
    - Run `openfl`.
        - You may need to [install lime](https://github.com/openfl/lime) yourself.
3. Open a command line in the project root directory containing `project.xml`.
4. Execute `lime build flash` to build and run the flash swf.
5. Download & install [Python](https://www.python.org/downloads/).
6. Execute `py distribute_lessons.py` to prepare the lesson folders.
7. Copy the `/assets` folder, the `/lessons` folder, and HTML files, including `index.html` to your webserver to deploy the lessons.
    - Try running it using `python -m SimpleHTTPServer`



Lessons
=======

1. Create a folder under `/lessons`, for example, `/lessons/numbers`.
2. Create a `lesson.txt` file inside it containing the lesson word list.
3. Run `py distribute_lessons.py` from the project root directory to copy the template `index.html` file to all the lesson folders.
4. Use the expected format:

```
Lesson X Exercise Y
Description goes here
'word': HINT
'word': HINT
```

For example:
```
Lesson 2 Exercise 3
Inversion
'edit': ETD
'elves': EFLS
'twelve': TWEFL
'credit': KRETD
'portal': PORLT
```

You can add settings to the end of the lesson:

```
Lesson 3F Exercise 1
Fingerspelling!
'The': T*P H* *E
'quick': KW* *EU KR* K*
'brown': PW* R* *O W* TPH*
'fox': TP* *O KP*
'jumps': SKWR* *U PH* P* S*
'over': *O SR* *E R*
'the': T* H* *E
'lazy': HR* *A *STPKW KWR*
'dog': TK* *O *TPKW
case_sensitive=true
```

Settings are expected to be in this format:

```
setting=value
```

The recognized settings are:

* case_sensitive : requires user to match uppercase and lowercase. False by default.
* require_spaces : requires user to generate spaces at the end of each word.
                   False by default. Mostly only useful for fingerspelling exercises.
* ignore_characters : ignores specified characters such as hyphens in prefix lesson.
* warning_message : arbitrary message at the top of the lesson title screen.
* notice_spaces



Issues
===========

* Replace with HTML5
* Support "space before" or "space after" Plover users
* Improve misstroke count to handle multi-stroke words where the first stroke doesn't match the first part of the word
