package es6_tests;

class TestSymbol extends haxe.unit.TestCase {
    public function testSymbolEquality() {
        var a:js.Symbol = new js.Symbol('foo');
        var b:js.Symbol = new js.Symbol('foo');

        assertFalse(a == b);
    }

    public function testSymbolAsMapKey() {
        var m = new js.Map<js.Symbol, Int>();
        var key:js.Symbol = new js.Symbol();

        assertEquals(m.has(key), false);

        m.set(key, 1);

        assertEquals(m.get(key), 1);

        assertEquals(m.has(key), true);

        assertEquals(m.delete(key), true);
        assertEquals(m.delete(key), false);

        assertEquals(m.has(key), false);
    }

    public function testKeyedSymbols() {
        var a:js.Symbol = js.Symbol.forKey('foo');
        var b:js.Symbol = js.Symbol.forKey('foo');

        assertEquals(js.Symbol.keyFor(a), 'foo');
        assertEquals(js.Symbol.keyFor(b), 'foo');

        assertEquals(a, b);
    }

}
