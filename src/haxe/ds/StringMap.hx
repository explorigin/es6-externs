package haxe.ds;

private class StringMapIterator<T> {
    var iter: es6.Iterator<T>;
    var done: Bool;
    var initialized: Bool = false;
    var pendingValue: T;

    public inline function new(iter:es6.Iterator<T>) {
        this.iter = iter;
    }
    public inline function hasNext(): Bool {
        if (initialized == false) {
            next();
        }
        return !done;
    }
    public inline function next(): T {
        if (initialized == false) {
            initialized = true;
            next();
        }

        var val = pendingValue;
        var i = iter.next();
        done = i.done;
        pendingValue = i.value;

        return val;
    }
}

@:coreApi class StringMap<T> implements haxe.Constraints.IMap<String, T> {
    var m = new es6.Map<String, T>();

    public function new() {};

    public inline function set( key : String, value : T ) : Void m.set(key, value);

    public inline function get( key : String ) : Null<T> return m.get(key);

    public inline function exists( key : String ) : Bool return m.has(key);

    public inline function remove( key : String ) : Bool return m.delete(key);

    public function keys() : Iterator<String> {
        return new StringMapIterator<String>(m.keys());
    }

    public inline function iterator() : Iterator<T> {
        return new StringMapIterator<T>(m.values());
    }

    public function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}
