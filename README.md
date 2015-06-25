# ES6 Features for Javascript

This project is an experiment to see how many ES6 features can be supported by Haxe purely with macros.

**NOTE** Many of the files in this project are modifications on files from the Haxe Standard Library.  Such files have their own license at the top.  For all other files, the included LICENSE file applies.

## Run tests

To ensure that your platform can run the ES6 output correctly, run the tests.

    haxe build.hxml

`test.html` is provided to run these tests in a browser.

## ES6 Features

- StringTools
	- trim uses String.trim() native implementation (this is really an ES5 feature)

- StringMap, IntMap, ObjectMap
    - implemented as a wrapper around ES6 Map type
