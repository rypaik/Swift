//: [Previous](@previous)
//: ## [Generics Part1 - YT Hacking with Swift](https://www.hackingwithswift.com/plus/intermediate-swift/understanding-generics-part-1)
import Foundation


//: ## Resolving Generics

// Traditional Function
func count(numbers:[Int]){
    let total = numbers.reduce(0, +)
    print("Total is \(total)")
}
count(numbers:[1, 2, 3])

// Throws up type Double error
//count(numbers:[1.5, 2.5, 3.5])

//: ### Solution to unknown type parameters

// Function with Generics
// <Number> is a places holder, can be labeled anything
// Numeric is a builtin Protocol
func countGenerics<Number: Numeric>(numbers: [Number]){
    let totalGenerics = numbers.reduce(0, +)
    print("Total is \(totalGenerics)")
}

countGenerics(numbers:[1, 2, 3])
countGenerics(numbers:[1.5, 2.5, 3.5])
countGenerics(numbers:[1, 2, 3.5])


// Same solution using Number Protocol no Generic
// THROWS ERROR: Protocol 'Numeric' can only be used as a generic constraint because it has Self or associated type requirements
//func countP(numbers: [Numeric]) {
//    let total = numbers.reduce(0, +)
//    print("Total is \(total)")
//}
//
//countP(numbers:[1, 2, 3])
//countP(numbers:[1.5, 2.5, 3.5])
//countP(numbers:[1, 2, 3.5])

//: Dynamic Dispatching - Reason for Generics
protocol Prioritized {
    var priority: Int { get }
    func alertIfImportant()
}

// without Generics
// type of parameter unknown at compile time

func checkPriority(of item: Prioritized) {
    print("Checking priority…")
    item.alertIfImportant()
}

struct Work: Prioritized {
    let priority: Int

    func alertIfImportant() {
        if priority > 3 {
            print("I'm important work!")
        }
    }
}

struct Document: Prioritized {
    let priority: Int

    func alertIfImportant() {
        if priority > 5 {
            print("I'm an important document!")
        }
    }
}


// Using Generics is better so at compile time the type of parameter is known and call the alerIFImportant() for the correct type
func checkPriorityGeneric<P: Prioritized>(of item: P) {
    print("Checking priority…")
    item.alertIfImportant()
}


//: [Next](@next)
