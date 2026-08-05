import Foundation

// normal func
func addNormal(_ a: Int, _ b: Int) -> Int {
    return a + b // you dont need to use return keyword
}
addNormal(10, 11)

// var func
let add: (Int, Int) -> Int = {
    (a: Int, b: Int) -> Int in a + b
}
add(2, 3)

// custom func ( trailing func )
func customAdd(
    _ a: Int,
    _ b: Int,
    using fn: (Int, Int) -> Int
) -> Int {
    fn(a, b)
}

// ways to call func
customAdd(2, 3, using: add)
customAdd(
    4,
    5,
    using: {
        (a: Int, b: Int) -> Int
        in a + b
    }
)

customAdd(4, 5){
    (a: Int, b: Int) -> Int
    in a + b
}

customAdd(4, 5){
    (a, b) in
    a + b
}

customAdd(4, 5){
    $0 + $1 // index0 + index1 = 4 + 5 = 9
}


// arrays closures
let ages = [30, 20, 19, 40, 50];

ages.sorted(by: {(a: Int, b: Int) -> Bool in
    a < b
})

//func < (a: Int, b: Int) -> Bool {
//    a < b
//}


// so you can use this way
ages.sorted(by: >)
ages.sorted(by: <)

func add10to(_ value: Int) -> Int {
    value + 10
}

func add20to(_ value: Int) -> Int {
    return value + 20
}

func doAddition(
    on value: Int,
    using fn: (Int) -> Int
) -> Int {
    return fn(value)
}

doAddition(on: 20, using: add10to(_:));
doAddition(on: 20, using: { (value) in value + 40 });
doAddition(on: 20){
    (value) in value + 40
};

