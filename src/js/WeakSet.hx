package js;

#if js

// http://www.ecma-international.org/ecma-262/6.0/#sec-weakset-objects
@:native("WeakSet")
extern class WeakSet<V> {
    public var size(default, null):Int;

    public function new(?initial:Array<V>);

    public function add(value:V):V;
    public function delete(value:V):Bool;
    public function has(value:V):Bool;
}

#end
