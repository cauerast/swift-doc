import Foundation

func noArgs() {
    "noArgs"
}

func twoArgs(_ a: Int, _ b: String) {
    "twoArgs: \(a), \(b)"
}

func twoArgsVars(a: Int, b: String) {
    "twoArgs: \(a), \(b)"
}

twoArgs(1, "2"); // using _ pass by order
twoArgsVars(a: 1, b: "2"); // pass defining values to compilor



func sum(a: Int, b: Int) -> Int {
    a + b // optional return (one line)
}

@discardableResult // to ignore error -> (non-used) in funcs or vars
func sumMulti(a: Int, b: Int) -> Int {
    let result = a + b
    return result // needs return keyword (multi-line)
}

sum(a: 2, b: 4);
sumMulti(a: 2, b: 8);
