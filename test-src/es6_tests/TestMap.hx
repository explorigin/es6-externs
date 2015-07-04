package es6_tests;

class TestMap extends haxe.unit.TestCase {
    public function testMap() {
        var m = new js.Map<String, Int>();

        assertEquals(m.has('a'), false);

        m.set('a', 1);

        assertEquals(m.get('a'), 1);

        assertEquals(m.has('a'), true);

        assertEquals(m.delete('a'), true);
        assertEquals(m.delete('a'), false);

        assertEquals(m.has('a'), false);

        m.set('a', 3);
        m.set('b', 2);
        m.set('c', 1);

        for (key in new js.tools.IteratorAdapter<String>(m.keys())) {
            assertTrue(['a', 'b', 'c'].indexOf(key) != -1);
        }

        for (value in new js.tools.IteratorAdapter<Int>(m.values())) {
            assertTrue([3, 2, 1].indexOf(value) != -1);
        }
    }
}
