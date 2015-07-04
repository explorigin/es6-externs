package es6_tests;

class TestWeakMap extends haxe.unit.TestCase {
    public function testWeakMap() {
        var m = new js.WeakMap<ObjKey, Int>();
        var key:ObjKey = {name: 'a'};

        assertEquals(m.has(key), false);

        m.set(key, 1);

        m.get(key);
        var aExists = m.has(key);
        if (aExists) {
            m.delete(key);

            assertEquals(m.has(key), false);
        } else {
            trace("Did not test remove.");
        }
    }
}
