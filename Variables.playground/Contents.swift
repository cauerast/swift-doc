import Foundation

// let = non mutable
let myName = "caue";
let lastName = "rast";

// var = mutable
// arrays in swift are structs
var names = [
    myName,
    lastName,
];
names.append("yolo")


// swift use value types, not reference
let foo = "foo"
var foo2 = foo
foo2 = "foo2"
foo
foo2

var moreNames = [
    "Foo",
    "Bar",
]
let copy = moreNames;
moreNames.append("baz")
moreNames
copy


//you can use reference types by in swift
let someNames = NSMutableArray(
    array: [
        "foo",
        "bar"
    ]
)
func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray;
    copy.add("baz");
}
changeTheArray(someNames)
someNames;
