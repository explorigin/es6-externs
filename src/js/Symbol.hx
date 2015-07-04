package js;

// http://www.ecma-international.org/ecma-262/6.0/#sec-symbol-objects
@:native("Symbol")
extern class Symbol {
    @:selfCall
    public static function get(description:Null<String>=null):Symbol;

    @:native("for")
    static public function forKey(key:String):Symbol;

    static public function keyFor(symbol:Symbol):String;
}
