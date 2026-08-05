import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
    case bird
}

// switch case
func describeAnimal(_ animal: Animals) {
    switch animal {
    case .cat:
        print("this is a cat")
    case .dog:
        print("this is a dog")
    case .rabbit:
        print("this is a rabbit")
    default:
        print("unknown animal")
    }
}

describeAnimal(Animals.cat)



// shortcut
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

// sujested
switch wwwApple {
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, songName: let songName):
    artist
    songName
    break
}

// used (without external argument name)
switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}


//
let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "whithout you"
)

if case let .song(_, songName) = withoutYou {
    songName
}


//
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    var manufacturer: String {
        switch self {
        case
            let .car(manufacturer, _),
            let .bike(manufacturer, _):
            return manufacturer
        }
    }
    
//    func getManufacturer() -> String {
//        switch self {
//        case
//            let .car(manufacturer, _),
//            let .bike(manufacturer, _):
//            return manufacturer
//        }
//    }
}

let car = Vehicle.car(manufacturer: "tesla", model: "x")
let bike = Vehicle.bike(manufacturer: "hd", yearMade: 1984)

car.manufacturer
bike.manufacturer


//

enum FamilyMember: String, CaseIterable {
    case father = "Dad"
    case mother = "mom"
    case brother = "bro"
    case sister = "sis"
}

FamilyMember.father.rawValue
FamilyMember.allCases.map(\.rawValue)

if let father = FamilyMember(rawValue: "Dad"){
    "found!"
    father
} else {
    "not found"
}

//
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}
var myHeight = Height.medium
myHeight.makeLong()
myHeight


// !
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        
            
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 3))
freeHand.calculateResult()
