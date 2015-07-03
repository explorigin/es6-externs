package js;


// http://www.ecma-international.org/ecma-262/6.0/#sec-weakmap-objects
@:native("WeakMap")
extern class WeakMap<K, V> {
    public var length(default, null):Int;

    public function new();

    public function set(key:K, value:V):V;
    public function get(key:K):V;
    public function has(key:K):Bool;
    public function delete(key:K):Bool;
}
