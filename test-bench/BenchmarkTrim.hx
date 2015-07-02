package;
import haxe.Timer;
import js.Boot;
import js.Browser;

using StringTools;

class BenchmarkTrim{
	static var index = 0;
	static var testCounts = [0, 10, 50, 500];
	static var boundMethods = new Map<Int, Dynamic>();

	static function native(a:Array<String>, count) {
		var data:Array<String> = [];
		for (i in 0...count)
			for (s in a)
				data.push(s.trim());
		return data;
	}

	static function std(a:Array<String>, count) {
		var data:Array<String> = [];
		for (i in 0...count)
			for (s in a)
				data.push(originalTrim(s));
		return data;
	}

	static function both(a:Array<String>, count) {
		var data:Array<String> = [];
		for (i in 0...count)
			for (s in a)
				data.push(trimBoth(s));
		return data;
	}

	static function runTests() {
		for (white in testCounts) {
			var count = Std.int(50000 / Math.pow(Math.log(white + 1)+2, 2));//less iterations for more whitespaces

			var data = untyped __js__("testData")[Std.string(white)];

			var boundNative = native.bind(data, count);
			var boundStd = std.bind(data, count);
			var boundBoth = both.bind(data, count);
			//These should do a heatup
			boundNative();
			boundStd();
			boundBoth();

			boundMethods[white] = {
				native: measure.bind(boundNative, '(native)'),
				std: measure.bind(boundStd, '(std)'),
				both: measure.bind(boundBoth, '(both)')
			};
		}

		gc();
		haxe.Timer.delay(next, 2000);
	}

	static function gc() {
		try {
			untyped __js__("CollectGarbage()");
		} catch (e:Dynamic) {
			try {
				untyped __js__("window.QueryInterface(Components.interfaces.nsIInterfaceRequestor).getInterface(Components.interfaces.nsIDOMWindowUtils).garbageCollect();");
			} catch (e:Dynamic) {}
		}
	}

	static function next() {
		var white = testCounts[index];

		var count = Std.int(50000 / Math.pow(Math.log(white + 1)+2, 2));//less iterations for more whitespaces
		trace('Trimming ${count * 100} times with an average of $white whitespaces');

		boundMethods[white].native();
		boundMethods[white].std();
		boundMethods[white].both();
		index++;

		gc();

		if (index < testCounts.length)
			// Give the browser plenty of time to perform a GC.
			haxe.Timer.delay(next, 2000);


	}

    static function main(){
        // Some tests require the DOM so we have to wait.
        js.Browser.document.addEventListener('DOMContentLoaded', runTests, false);
    }

    static function measure(func, logMsg) {
		var s = Timer.stamp();
		var r:Dynamic;
		try {
			r = func();
		} catch (e:Dynamic) {
			haxe.Log.trace("(failed) " + e + " " + logMsg);
		}
		haxe.Log.trace(Timer.stamp() - s + "s " + logMsg);
		return r;
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

	static function originalTrim(s:String)
		return s.ltrim().rtrim();

}
