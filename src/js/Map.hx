package js;

// http://www.ecma-international.org/ecma-262/6.0/#sec-map-objects
@:native("Map")
extern class Map<K, V> {
    public var size(default, null):Int;

    public function new();

    public function set(key:K, value:V):V;
    public function get(key:K):V;
    public function has(key:K):Bool;
    public function delete(key:K):Bool;
    public function keys():js.Iterator<K>;
    public function values():js.Iterator<V>;
    public function clear():Void;
}
