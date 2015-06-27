package haxe.ds;

@:coreApi class IntMap<T> implements haxe.Constraints.IMap<Int, T> {
    var m = new js.Map<Int, T>();

    public function new() {};

    public inline function set( key : Int, value : T ) : Void m.set(key, value);

    public inline function get( key : Int ) : Null<T> return m.get(key);

    public inline function exists( key : Int ) : Bool return m.has(key);

    public inline function remove( key : Int ) : Bool return m.delete(key);

    public function keys() : Iterator<Int> {
        return new js.Iterator.MapIteratorAdapter<Int>(m.keys());
    }

    public inline function iterator() : Iterator<T> {
        return new js.Iterator.MapIteratorAdapter<T>(m.values());
    }

    public function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}
