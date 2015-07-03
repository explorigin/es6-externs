package js;

// http://www.ecma-international.org/ecma-262/6.0/#sec-set-objects
@:native("Set")
extern class Set<V> {
    public var size(default, null):Int;

    public function new(?initial:Array<V>);

    public function add(value:V):V;
    public function clear():Void;
    public function delete(value:V):Bool;
    public function has(value:V):Bool;
    public function entries():js.Iterator<Array<V> >;
    public function keys():js.Iterator<V>;
    public function values():js.Iterator<V>;

    public function forEach(callback:V->V->Set<V>->Void, ?thisArg:Dynamic):Void;
}
