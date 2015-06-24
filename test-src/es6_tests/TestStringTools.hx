package es6_tests;

using StringTools;

class TestStringTools extends haxe.unit.TestCase {
	public function testTrimUsesNativeImplementation() {
		assertTrue(((untyped ''.trim).toString():String).indexOf('"".trim()') != -1);
	}
}
