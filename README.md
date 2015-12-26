HaxePloverLearn
===========

*a fork of [PloverLearn](https://github.com/larsiusprime/haxeploverlearn) by [Lars Doucet](https://github.com/larsiusprime)*

Drills for the Learn Plover! book, part of the Open Steno Project.

Website: [di.id.au/plover/learn/](http://di.id.au/plover/learn/)



Building
========

1. Download & install Haxe/OpenFL ([instructions](http://www.openfl.org/documentation/getting-started/installing-openfl/))
2. Open a command line in the same directory as project.xml
3. Execute ```lime build flash``` to build & run the flash swf
4. Download & install Python ([site](https://www.python.org/downloads/))
5. Execute ```py distribute_lessons.py``` to prepare the lesson folders
6. Copy the contents of the "Assets" folder to your webserver to deploy the lessons



Lessons
=======

1. Create a folder under `/assets`
2. Create a `lesson.txt` file inside it
3. Run `py distribute_lessons.py` to add an `index.html` file to all the lesson folders
4. Use the correct format:

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

You can also add settings to the lessons:

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

You add settings by entering text of the format

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



Coming Soon
===========

HTML5
