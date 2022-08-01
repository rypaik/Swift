//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: Strings
/*:
 Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version. Value types are described in Structures and Enumerations Are Value Types.
 */
var emptyString = ""               // empty string literal
var anotherEmptyString = String()

// String Inerpolation
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."


// Inserting and Removing

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"


welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"



// substrings
    let greeting = "Hello, world!"
    let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
    let beginning = greeting[..<index]
    // beginning is "Hello"

    // Convert the result to a String for long-term storage.
    let newString = String(beginning)



//: characters

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)


let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


//: [Next](@next)
