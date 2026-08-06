import Foundation

// protocols are interfaces

protocol canBreathe {
    func breathe()
}
// structs can inherith interfaces, but not outher structs
struct Animal: canBreathe {
    func breathe() {
        print("animal is inhale and exhale")
    }
}

struct Person: canBreathe {
    func breathe() {
        print("person is inhale and exhale")
    }
}

let dog = Animal();
let person1 = Person();

dog.breathe()
person1.breathe()

// to define data of function, need to use extensions

protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        print("can jump")
    }
}

struct Cat: CanJump {
    func jump() {
        print("cat can jump")
    }
}

let whiskers = Cat()
whiskers.jump()


// protocols can manage vars too
protocol HasName {
    var name: String { get }
    var age: Int { get set }
}

struct Dog: HasName {
    let name: String // let contant only get { unmutable }
    var age: Int // var, mutable { get and set }
}

var woof = Dog(name: "woof", age: 10)

// mutating func example
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int) -> Void
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) -> Void {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}
var bike = Bike()
bike.speed;
bike.increaseSpeed(by: 10)
bike.speed



// compare using 'is'
func describe(obj: Any){
    if obj is Vehicle {
        "obj conforms to the Vehicle protocol"
    } else {
        "obj does not conform to the Vehicle protocol"
    }
}
describe(obj: bike)



// promote using 'as'
func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle { // copy by value, because obj is struct
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "this wasn't a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike)
bike.speed // bike is a struct, so increaseSpeed func doesn't affect the bike struct
// vehicle is a copy by value
// if bike was a class, vehicle was in same memory adress so both will change
