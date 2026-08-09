import Foundation
//generics, in this example we try to create a func to permorm something that acceps any type of Value: int or double ou CGFloat, etc.

// func in Ints
func performInt(_ op: (Int, Int) -> Int, on lhs: Int, and rhs: Int) -> Int {
    op(lhs, rhs)
}
performInt(+, on: 10, and: 20)

//func in Doubles
func performDouble(_ op: (Double, Double) -> Double, on lhs: Double, and rhs: Double) -> Double {
    op(lhs, rhs)
}
performDouble(+, on: 10, and: 20)




// we needs func that func to any type of value
// so ->

//accept any Numeric type
func perform<N: Numeric>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N {
    op(lhs, rhs)
}
perform(+, on: 10, and: 20)

//this make the same stuff
func perform2<N>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N where N: Numeric {
    op(lhs, rhs)
}
perform2(+, on: 10, and: 20)





// we can use a combo of generics
protocol canJump {
    func jump()
}
protocol canRun {
    func run()
}
struct Person: canJump, canRun {
    func jump() {
        "jumping..."
    }
    
    func run() {
        "running..."
    }
}
// combo
func jumpAndRun<T: canJump & canRun>(_ value: T){
    value.jump();
    value.run();
}
// test
let person = Person()
jumpAndRun(person)





// generics on extensions

// ex1. Strings
// extension Array<String> or:
extension [String] {
    func longestString() -> String? {
        self.sorted { (a: String, b: String) -> Bool in a.count > b.count }.first;
    }
}

["aaa", "bb", "c"].longestString()

// ex2. Ints
extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}
[1, 2, 3, 4].average();





// views example
// show any type of data to user
protocol View {
    func addSubView(_ view: View)
}
extension View {
    func addSubView(_ view: View){
        // non
    }
}
struct Button: View {
    // non
}
struct Table: View {
    // non
}

// type that we'll show
// obs: in swift we need to use associatedtype to define the generic type
//      compilor can't accept "PresentableAsView<T: x>",
//      so we do that ->

protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(superView: View, thisView: ViewType)
    func present(view: ViewType, on superView: View)
}

extension PresentableAsView {
    func configure(superView: View, thisView: ViewType){
        // non
    }
    func present(view: ViewType, on superView: View){
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
    
    func configure(superView: View, thisView: Button) { }
}

extension PresentableAsView where ViewType == Button {
    func doSomethingWithButton(){
        "This is a button"
    }
}

let button = MyButton();
button.doSomethingWithButton()

struct MyTable: PresentableAsView {
    func produceView() -> Table {
        Table()
    }
}

let table = MyTable()
