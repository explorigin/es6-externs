package;
import haxe.Timer;
import js.Boot;
import js.Browser;

using StringTools;

class BenchmarkTrim{
	static var WHITE = [0x9, 0xa, 0xb, 0xc, 0xd, 0x20];
	static function main() {
		
		for (white in [0, 10, 50, 500]) {
			
			var a = [for (i in 0...100) { 
				
				var buf = new StringBuf();
				
				function addWhite()
					buf.addChar(WHITE[Std.random(WHITE.length)]);
					
				for (i in 0...Std.random(white))
					addWhite();
					
				for (i in 0...Std.random(100))
					buf.addChar('a'.code);
				for (i in 0...Std.random(white))
					addWhite();
					
				buf.toString();
			}];
			
			var count = Std.int(50000 / Math.pow(Math.log(white + 1)+2, 2));//less iterations for more whitespaces
			
			trace('Trimming ${count * 100} times with an average of $white whitespaces');
			
			function native()
				for (i in 0...count) 
					for (s in a) 
						s.trim();
				
			function std()
				for (i in 0...count) 
					for (s in a) 
						s.ltrim().rtrim();
				
			function both()	
				for (i in 0...count) 
					for (s in a) 
						trimBoth(s);
			
			//These should do a heatup
			native();
			std();
			both();
			
			
			Timer.measure(native);
			Timer.measure(std);
			Timer.measure(both);
			
			Timer.delay(function () { }, 50000);
		}
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