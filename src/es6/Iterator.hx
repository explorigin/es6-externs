package es6;

typedef IteratorValue<T> = {
    value: T,
    done: Bool
};

typedef Iterator<T> = {
    next: Void -> IteratorValue<T>
};

class MapIteratorAdapter<T> {
    var iter: es6.Iterator<T>;
    var done: Bool;
    var initialized: Bool = false;
    var pendingValue: T;

    public inline function new(iter:es6.Iterator<T>) {
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
