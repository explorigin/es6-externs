package es6_tests;

import haxe.ds.StringMap;

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

    // public function testStringMap() {
    //     var m = new StringMap<Int>();

    //     assertEquals(m.exists('a'), false);

    //     m.set('a', 1);

    //     assertEquals(m.get('a'), 1);

    //     assertEquals(m.exists('a'), true);

    //     assertEquals(m.remove('a'), true);
    //     assertEquals(m.remove('a'), false);

    //     assertEquals(m.exists('a'), false);

    //     m.set('a', 3);
    //     m.set('b', 2);
    //     m.set('c', 1);

    //     for (key in m.keys()) {
    //         assertTrue(['a', 'b', 'c'].indexOf(key) != -1);
    //     }

    //     for (value in m) {
    //         assertTrue([3, 2, 1].indexOf(value) != -1);
    //     }
    // }
}
