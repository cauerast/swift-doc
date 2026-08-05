import Foundation

// compilor make contructor of structures auto.
struct Person {
    let name: String,
        age: Int
}
let foo = Person(name: "Foo", age: 20)

foo.name;
foo.age;


// struct and constructor
struct CommodoreComputer {
    let name: String,
        manufacturer: String
    init(name: String){ // contructor = init
        self.name = name;
        self.manufacturer = "Commodore";
    }
}

let c64 = CommodoreComputer(name: "C64");
c64.name;
c64.manufacturer;

struct Person2 {
    let firstName: String,
        lastName: String
    var fullname: String {
            "\(firstName) \(lastName)"
        }
}

let fooBar = Person2(firstName: "foo", lastName: "bar")
fooBar.firstName;
fooBar.lastName;
fooBar.fullname;


// to mutate variables inside a structure
struct Car {
    var currentSpeed: Int = 0
    mutating func drive(speed: Int) {
        currentSpeed = speed;
    }
}

var mutableCar = Car(currentSpeed: 10); // must be var


// but you can create a func inside the struct to change the value
// because swift pass by value, not reference
struct Bike {
    let manufacturer: String,
        currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike (manufacturer:
                self.manufacturer,
              currentSpeed: currentSpeed
        )
    }
}

let bike1 = Bike(manufacturer: "hs", currentSpeed: 20);
let bike2 = bike1.copy(currentSpeed: 30);
bike1.currentSpeed;
bike2.currentSpeed;
