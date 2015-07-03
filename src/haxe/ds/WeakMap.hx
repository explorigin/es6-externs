package haxe.ds;

@:coreApi class WeakMap<K: {}, V> implements haxe.Constraints.IMap<K, V> {
    var m = new js.WeakMap<K, V>();
    var _keys = new Array<K>();

    public function new() {};

    public inline function set( key : K, value : V ) : Void m.set(key, value);

    public inline function get( key : K ) : Null<V> return m.get(key);

    public inline function exists( key : K ) : Bool return m.has(key);

    public inline function remove( key : K ) : Bool return m.delete(key);

    // NOTE: ES6 does not support iteration over a WeakMap because it introduces non-determinism.
    public function keys() : Iterator<K> {
        throw "Not implemented for this platform";
    }

    public inline function iterator() : Iterator<V> {
        throw "Not implemented for this platform";
    }

    public function toString() : String {
        return "WeakMap()";
    }
}
