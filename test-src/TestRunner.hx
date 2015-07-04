package ;

class TestRunner {
    static function runTests() {
        js.Browser.document.querySelector('#notice').style.display = "None";

        var r = new haxe.unit.TestRunner();

        r.add(new es6_tests.TestMap());
        r.add(new es6_tests.TestSet());
        r.add(new es6_tests.TestIterator());
        r.add(new es6_tests.TestWeakMap());
        r.add(new es6_tests.TestSymbol());
        r.run();
    }

    static function main(){
        // Some tests require the DOM so we have to wait.
        js.Browser.document.addEventListener('DOMContentLoaded', runTests, false);
    }
}
