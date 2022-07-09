//
//  Closures.swift
//  Snippets
//
//  Created by Jeen Byun on 7/7/22.
//
// closures are functions wrapped in a var
// can be passed around
// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

//https://docs.swift.org/swift-book/LanguageGuide/Closures.html
//https://www.youtube.com/watch?v=8TpLDqOO6VE&ab_channel=iOSAcademy


import Foundation
 
// Int ins in () becuase that is parameter type
// Bool is return type

// var myFunction: ((Int) -> Void)     closure that returns nothing
//var myFunction: ((Int) -> ())
//var myFunction: ((Int) -> (Void))

var myFunction: ((Int) -> Bool) = { number in
    if number > 3 {
        return true
    }
    return false
}
// Calling closure

let result = myFunction(4)


// multiple parameters
var myFunction2: ((Int, Int) -> (Bool)) = {number, other in
    if number > 3 {
        return true
    }
    return false
}


// standard function
func isGreaterThanThree( number: Int) -> Bool {
    if number > 3 {
        return true
    }
    return false
}
// Calling function

let result2 = isGreaterThanThree(number: 4)


// NORMAL FUNCTION
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNamesNormal = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]



// CLOSURE EXPRESSION
// SYNTAX
//{ (parrameter) -> return type in
//    statements
//}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

reversedNames = names.sorted(by: { (s1: string, s2: String) -> Bool in
    return s1 > s2
    })


// inferred type from context in Closure
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )


// Implicit returns
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )


// ShortHand Argument Names
reversedNames = names.sorted(by: { $0 > $1 } )

// Operator Methods
reversedNames = names.sorted(by: >)




// TRAILING CLOSURES
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// identical - clsoue exspression is providasd s the functions only arguemnt - () cne be taken out
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }



// the map(_:) method with a trailing closure to convert an array of Int values into an array of String values
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]




// Mulitple Closures
// loads a picture from photo gallery
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}




// CAPTURING VALUES
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

