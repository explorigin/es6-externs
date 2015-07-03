# ES6 Features for Javascript

This project is an experiment to see how many ES6 features can be supported by Haxe purely with macros.

## Run tests

To ensure that your platform can run the ES6 output correctly, run the tests.

    haxe build.hxml

`test.html` is provided to run these tests in a browser.

## ES6 Externs
- Set
- Map
- Iterator
- WeakMap

## Haxe Core Types
- StringMap, IntMap, ObjectMap
    - implemented as a wrapper around ES6 Map type
- WeakMap
    - partially implemented as a wrapper around ES6 WeakMap type
