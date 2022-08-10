//: [Previous](@previous)
//: [Hakcing with Swift Generics ](https://www.hackingwithswift.com/plus/intermediate-swift/understanding-generics-part-1)
import Foundation

//: ## Alphabet Spaghetti
//: ### Regular Function

func count(numbers: [Int]) {
    let total = numbers.reduce(0, +)
    print("Total is \(total)")
}

count(numbers: [1, 2, 3])
// throws error - expecting type int
// count(numbers: [1.5, 2.5, 3.5])


/*:
inside angle brackets are called generic parameters: they
specify the different ways the function or type can be
used. These generic parameters are placeholders for real
data types such as Int or String – we don’t know what
Number will be, but we don’t actually care because or
function will work regardless.
 
 
 It’s common to use single-letter generic parameter names, such as T, U, and V. The convention is to use them in that order, to mean “here are three placeholders”. They might end up being the same type or different types, it doesn’t really matter – they are just placeholders.

 Swift does not care if you use count<Number>(numbers: [Number]) or count<T>(numbers: [T]) – the Number and T are both placeholders, so use whichever you prefer.

*/
//: ### Generics Version
func count_generic<T>(numbers: [T]) {
//    let total = numbers.reduce(0, +) //+ operator implies Numeric: Int, Float, or Double
    print("Generics Total is \(numbers)")
}
count_generic(numbers: [7,8,9])

func count_generic_no_param<T>(_ numbers: [T]) {
//    let total = numbers.reduce(0, +) //+ operator implies Numeric: Int, Float, or Double
    print("Generics Total is \(numbers)")
}
count_generic_no_param([1,2,3])

//: restraints on the generic for builtin operations
//: ### Generics Version with Constraint
func count_generic_restraint<Number: Numeric>(numbers: [Number]) {
    let total = numbers.reduce(0, +)
    print("Generics Total is \(total)")
}

//should work without label numbers in call
//count_generic_restraint([2, 3, 4]) // in playground throws error

count_generic_restraint(numbers: [1.5, 2.5, 3.5])



//: ## PROTOCOL VERSION
//func count_protocol(numbers: [Numeric]) {
//    let total = numbers.reduce(0, +)
//    print("Total is \(total)")
//}
// Throws Error - Numeric type can only be used as a generic constraint


//: ## Using Dispatch

//: [Next](@next)
//: #### Linked Topics
//: [Protocols](Protocols)
