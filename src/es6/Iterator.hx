package es6;

typedef IteratorValue<T> = {
    value: T,
    done: Bool
};

extern class Iterator<T> {
    public function next():IteratorValue<T>;
}
