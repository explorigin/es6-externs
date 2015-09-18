package es6_tests;

class TestWeakSet extends haxe.unit.TestCase {
    public function testWeakSet() {
        var m = new js.WeakSet<ObjKey>();
        var key:ObjKey = {name: 'a'};

        assertEquals(m.has(key), false);

        m.add(key);

        var aExists = m.has(key);
        if (aExists) {
            m.delete(key);

            assertEquals(m.has(key), false);
        } else {
            trace("Did not test remove.");
        }
    }
}
