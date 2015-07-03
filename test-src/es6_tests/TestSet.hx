package es6_tests;


class TestSet extends haxe.unit.TestCase {
    public function testSet() {
        var s = new js.Set<String>();

        assertEquals(s.has('a'), false);

        s.add('a');

        assertEquals(s.has('a'), true);

        assertEquals(s.delete('a'), true);
        assertEquals(s.delete('a'), false);

        assertEquals(s.has('a'), false);

        s.add('a');
        s.add('b');
        s.add('c');

        var i = s.keys();
        var val = i.next();
        while (!val.done) {
            assertTrue(['a', 'b', 'c'].indexOf(val.value) != -1);
            val = i.next();
        }

        i = s.values();
        val = i.next();
        while (!val.done) {
            assertTrue(['a', 'b', 'c'].indexOf(val.value) != -1);
            val = i.next();
        }
    }

    public function testIteratorAdapter() {
        var s = new js.Set<String>();
        s.add('a');
        s.add('b');
        s.add('c');

        var iter = new js.Iterator.IteratorAdapter<String>(s.keys());

        assertEquals(iter.next(), 'a');
        assertEquals(iter.next(), 'b');
        assertEquals(iter.next(), 'c');
        assertEquals(iter.next(), null);

        var iter = new js.Iterator.IteratorAdapter<String>(s.values());

        assertEquals(iter.next(), 'a');
        assertEquals(iter.next(), 'b');
        assertEquals(iter.next(), 'c');
        assertEquals(iter.next(), null);

        var iter = new js.Iterator.IteratorAdapter<String>(s.values());

        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 'a');
        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 'b');
        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 'c');
        assertEquals(iter.hasNext(), false);
        assertEquals(iter.next(), null);
        assertEquals(iter.hasNext(), false);
    }
}
