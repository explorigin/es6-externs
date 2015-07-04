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
}
