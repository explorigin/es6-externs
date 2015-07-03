package haxe.ds;

@:coreApi class StringMap<T> implements haxe.Constraints.IMap<String, T> {
    var m = new js.Map<String, T>();

    public function new() {};

    public inline function set( key : String, value : T ) : Void m.set(key, value);

    public inline function get( key : String ) : Null<T> return m.get(key);

    public inline function exists( key : String ) : Bool return m.has(key);

    public inline function remove( key : String ) : Bool return m.delete(key);

    public function keys() : Iterator<String> {
        return new js.Iterator.IteratorAdapter<String>(m.keys());
    }

    public inline function iterator() : Iterator<T> {
        return new js.Iterator.IteratorAdapter<T>(m.values());
    }

    public function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}
