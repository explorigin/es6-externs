package js.tools;

class IteratorAdapter<T> {
    var iter: js.Iterator<T>;
    var done: Bool;
    var initialized: Bool = false;
    var pendingValue: T;

    public inline function new(iter:js.Iterator<T>) {
        this.iter = iter;
    }

    private inline function initialize() {
        var i = iter.next();
        done = i.done;
        pendingValue = i.value;
        initialized = true;
    }

    public inline function hasNext(): Bool {
        if (initialized == false) {
            initialize();
        }
        return !done;
    }
    public inline function next(): T {
        if (initialized == false) {
            initialize();
        }

        var val = pendingValue;
        var i = iter.next();
        done = i.done;
        pendingValue = i.value;

        return val;
    }
}
