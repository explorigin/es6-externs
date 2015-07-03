package es6_tests;

import haxe.ds.WeakMap;

class TestWeakMap extends haxe.unit.TestCase {
    public function testWeakMap() {
        var m = new WeakMap<ObjKey, Int>();
        var key:ObjKey = {name: 'a'};

        assertEquals(m.exists(key), false);

        m.set(key, 1);

        m.get(key);
        var aExists = m.exists(key);
        if (aExists) {
            m.remove(key);

            assertEquals(m.exists(key), false);
        } else {
            trace("Did not test remove.");
        }
    }
}
