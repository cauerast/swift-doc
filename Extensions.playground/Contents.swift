import Foundation

// example
extension Int {
    func plusTwo() -> Int {
        return self + 2
    }
}

let two = 2
two.plusTwo()


// you can extend structs in swift
struct Person {
    let firtsName: String
    let lastName: String
}

extension Person {
    init(fullName: String){
        let components = fullName.components(separatedBy: " ")
        self.firtsName = components.first ?? fullName;
        self.lastName = components.last ?? fullName;
    }
}

let person = Person(fullName: "Foo Bar")
person.firtsName
person.lastName


// you can extend a protocol
protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        return "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "Model X")

extension Car: GoesVroom {
    var vroomValue: String {
        return "\(self.manufacturer) \(self.model)"
    }
}

modelX.goVroom()

//extending classes with convenience initializer
class MyDouble {
    let value: Double
    init(value: Double){
        self.value = value
    }
}

extension MyDouble {
    convenience init (){
        self.init(value: 0)
    }
}

MyDouble().value;
