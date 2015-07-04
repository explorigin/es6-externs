package es6_tests;

class TestIterator extends haxe.unit.TestCase {
    public function testIteratorAdapter() {
        var m = new js.Map<String, Int>();
        m.set('a', 3);
        m.set('b', 2);
        m.set('c', 1);

        var iter = new js.tools.IteratorAdapter<String>(m.keys());

        assertEquals(iter.next(), 'a');
        assertEquals(iter.next(), 'b');
        assertEquals(iter.next(), 'c');
        assertEquals(iter.next(), null);

        var iter = new js.tools.IteratorAdapter<Int>(m.values());

        assertEquals(iter.next(), 3);
        assertEquals(iter.next(), 2);
        assertEquals(iter.next(), 1);
        assertEquals(iter.next(), null);

        var iter = new js.tools.IteratorAdapter<Int>(m.values());

        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 3);
        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 2);
        assertEquals(iter.hasNext(), true);
        assertEquals(iter.next(), 1);
        assertEquals(iter.hasNext(), false);
        assertEquals(iter.next(), null);
        assertEquals(iter.hasNext(), false);
    }
}
