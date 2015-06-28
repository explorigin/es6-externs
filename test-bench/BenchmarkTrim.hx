package;
import haxe.Timer;
import js.Boot;
import js.Browser;

using StringTools;

class BenchmarkTrim{
	static function native(a:Array<String>, count)
		for (i in 0...count)
			for (s in a)
				s.trim();

	static function std(a:Array<String>, count)
		for (i in 0...count)
			for (s in a)
				s.ltrim().rtrim();

	static function both(a:Array<String>, count)
		for (i in 0...count)
			for (s in a)
				trimBoth(s);

	static function runTests() {
		for (white in [0, 10, 50, 500]) {
			var count = Std.int(50000 / Math.pow(Math.log(white + 1)+2, 2));//less iterations for more whitespaces

			var data = untyped __js__("testData")[Std.string(white)];

			trace('Trimming ${count * 100} times with an average of $white whitespaces');

			var boundNative = native.bind(data, count);
			var boundStd = std.bind(data, count);
			var boundBoth = both.bind(data, count);
			//These should do a heatup
			boundNative();
			boundStd();
			boundBoth();

			measure(boundNative, '(native)');
			measure(boundStd, '(std)');
			measure(boundBoth, '(both)');
		}
	}

    static function main(){
        // Some tests require the DOM so we have to wait.
        js.Browser.document.addEventListener('DOMContentLoaded', runTests, false);
    }

    static function measure(func, logMsg) {
		var s = Timer.stamp();
		func();
		haxe.Log.trace(Timer.stamp() - s + "s " + logMsg);
    }

	static function leftWhite(s:String, l:Int) {
		for (i in 0...l) {
			var c = s.fastCodeAt(i);
			if (!((c > 8 && c < 14) || c == 32)) return i;
		}
		return l;
	}

	static function rightWhite(s:String, l:Int) {
		for (i in 1...l+1) {
			var c = s.fastCodeAt(l-i);
			if (!((c > 8 && c < 14) || c == 32)) return i-1;
		}
		return l;
	}

	static function trimBoth(s:String) {
		var l = s.length;
		var left = leftWhite(s, l);

		if (left == l) return '';

		var right = rightWhite(s, l);

		return
			if (left + right == 0) s;
			else
				s.substring(left, l - right);
	}

}
