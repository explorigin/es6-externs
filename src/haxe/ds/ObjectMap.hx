package haxe.ds;

@:coreApi class ObjectMap<K:{ }, T> implements haxe.Constraints.IMap<K, T> {
    var m = new js.Map<K, T>();

    public function new() {};

    public inline function set( key : K, value : T ) : Void m.set(key, value);

    public inline function get( key : K ) : Null<T> return m.get(key);

    public inline function exists( key : K ) : Bool return m.has(key);

    public inline function remove( key : K ) : Bool return m.delete(key);

    public function keys() : Iterator<K> {
        return new js.Iterator.IteratorAdapter<K>(m.keys());
    }

    public inline function iterator() : Iterator<T> {
        return new js.Iterator.IteratorAdapter<T>(m.values());
    }

    public function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}
