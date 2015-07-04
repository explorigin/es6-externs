package js;

typedef IteratorValue<T> = {
    value: T,
    done: Bool
};

typedef Iterator<T> = {
    next: Void -> IteratorValue<T>
};
