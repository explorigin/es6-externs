package es6_tests;

import haxe.ds.IntMap;
import haxe.ds.StringMap;
import haxe.ds.ObjectMap;

class TestMap extends haxe.unit.TestCase {
    public function testStringMap() {
        var m = new StringMap<Int>();

        assertEquals(m.exists('a'), false);

        m.set('a', 1);

        assertEquals(m.get('a'), 1);

        assertEquals(m.exists('a'), true);

        assertEquals(m.remove('a'), true);
        assertEquals(m.remove('a'), false);

        assertEquals(m.exists('a'), false);

        m.set('a', 3);
        m.set('b', 2);
        m.set('c', 1);

        for (key in m.keys()) {
            assertTrue(['a', 'b', 'c'].indexOf(key) != -1);
        }

        for (value in m) {
            assertTrue([3, 2, 1].indexOf(value) != -1);
        }
    }

    public function testIntMap() {
        var m = new IntMap<String>();

        assertEquals(m.exists(2), false);

        m.set(2, 'a');

        assertEquals(m.get(2), 'a');

        assertEquals(m.exists(2), true);

        assertEquals(m.remove(2), true);
        assertEquals(m.remove(2), false);

        assertEquals(m.exists(2), false);

        m.set(2, 'b');
        m.set(3, 'c');
        m.set(4, 'a');

        for (key in m.keys()) {
            assertTrue([2, 3, 4].indexOf(key) != -1);
        }

        for (value in m) {
            assertTrue(['b', 'c', 'a'].indexOf(value) != -1);
        }
    }

    public function testObjectMap() {
        var m = new ObjectMap<ObjKey, String>();
        var keyA = {name: 'a'};
        var keyB = {name: 'b'};
        var keyC = {name: 'c'};

        assertEquals(m.exists(keyA), false);

        m.set(keyA, 'a');

        assertEquals(m.get(keyA), 'a');

        assertEquals(m.exists(keyA), true);

        assertEquals(m.remove(keyA), true);
        assertEquals(m.remove(keyA), false);

        assertEquals(m.exists(keyA), false);

        m.set(keyA, 'b');
        m.set(keyB, 'c');
        m.set(keyC, 'a');

        for (key in m.keys()) {
            assertTrue([keyA, keyB, keyC].indexOf(key) != -1);
        }

        for (value in m) {
            assertTrue(['b', 'c', 'a'].indexOf(value) != -1);
        }
    }
}
