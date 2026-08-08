import Foundation

// classes needs a init
class Person {
    var name: String,
        age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge(){
        self.age += 1
    }
}

let foo = Person(name: "foo", age: 10)
foo.age += 10 // you can change externaly
foo.age;
foo.increaseAge() // you can change internaly
foo.age

// classes appoints to the same addres in memory
// thats not a copy
let bar = foo
bar.increaseAge()
foo.age
bar.age


class Vehicle {
    func goVroom() -> String {
        "Vroom"
    }
}

// Car inheritance Vehicle
class Car: Vehicle {
    override func goVroom() -> String {
        "Zoom"
    }
}

let car = Car()
car.goVroom()


class Person2 {
    private(set) var name: String // now you cant change values externaly
    private(set) var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge(){
        self.age += 1
    }
}

let baz = Person2(name: "baz", age: 31)
baz.age;
//baz.age += 1;    cant change values externaly
baz.increaseAge()
baz.age


class Tesla {
    let manufacturer = "tesla"
    let model: String;
    let year: Int;
    
    init(){
        self.model = "X"
        self.year = 2023
    }
    
    init(model: String, year: Int){
        self.model = model
        self.year = year
    }
    
    convenience init (model: String){
        self.init(
            model: model,
            year: 2023
        )
    }
}

class TeslaModelY: Tesla {
    override init() {
        super.init(model: "Y", year: 2025)
    }
}

let fooBar = Person2(name: "yolo", age: 20)
fooBar.age
func doSomething(with person: Person2){
    person.increaseAge()
}
doSomething(with: fooBar)
fooBar.age

class MyClass {
    init(){
        "initialized" // start obj
    }
    func doSomething(){
        "do something"
    }
    deinit {
        "Deinitialized" // free obj memory
    }
}

let myClosure = {
    let myClass = MyClass() // start
    myClass.doSomething()
} // end (free obj memory)

myClosure()

