//: [Previous](@previous)


//: https://www.codingem.com/swift-underscore/

import Foundation
import SwiftUI
import PlaygroundSupport

//: _____
//: For Loops
for _ in 1...5 {
    print("Hello")
}

//: _____
//: Function Calls - Omitting Argument Label
func greet(_ name: String) {
    print("Hello, \(name)")
}
greet("Alice")
// greet(name: "Alice")


//: _____
//: Tuples - ignore parts of tuples
let coords = (1.0, 2.0, 0.5, 2.5)
let (x, y, z, _) = coords
print(x, y, z)

//
let score = ("Alice", 3)
switch score {
case (_, 3):
    print("Par")
case (_, 2):
    print("Birdie")
case (_, 1):
    print("Ace")
default:
    fatalError("Unsupported")
}


//: _____
//: Make Numbers readable
print(100_000_000)
print(0.000_000_001)



//: _____
//: Enums - Ignore Assocaited Values

enum Action {
    case Driving(Int, Int)
    case Walking(Int, Int)
    func horizontalMovement() {
        switch self {
        case .Driving(let xSpeed, _):
            print("Driving \(xSpeed)mph in x-direction")
        case .Walking(let xSpeed, _):
            print("Walking \(xSpeed)mph in x-direction")
        default:
            fatalError("Unsupported")
        }
    }
}

let a = Action.Driving(10, 5)
a.horizontalMovement()
let b = Action.Walking(5,1)
b.horizontalMovement()


//: ______
//: Closures - Skip Parameters
let scores = [
    ("Alice",    3),
    ("Bob",      3),
    ("Charlie",  2),
    ("David",    3),
    ("Emmanuel", 2)
]

let lessThanThree = scores.filter { (_, score) in return score < 3 }

lessThanThree.forEach { (name, _) in print("\(name)") }


//: ______
//: Functions - Skip Return Value
func giveName() -> String {
    return "Alice"
}
print(giveName())

//This action does not store the return value anywhere.
_ = giveName()



//: ______
//: Skip Override Parameters Labeled with _
class Pet {
    let name: String
    init(name: String) {
        self.name = name
    }
    func timeTo(_ command: String) {
        if command == "eat" { print("Yum!") }
        else if command == "sleep" { print("Zzz...") }
    }
}
class Cat: Pet {
    // Cat does not care about the command, let's skip it.
    override func timeTo(_ _: String) {
        print("Meow!")
    }
}
// Example calls:
let dog = Pet(name: "Snoopy")
dog.timeTo("sleep")
let cat = Cat(name: "Luna")
cat.timeTo("sleep")






//: ______
struct MenuView: View {
    var body: some View {
        Text("UnderScore Operator")
        
    }
}
        

//PlaygroundPage.current.setLiveView(MenuView())






//: [Next](@next)
