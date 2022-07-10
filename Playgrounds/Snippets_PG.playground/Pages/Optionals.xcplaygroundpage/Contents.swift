//: [Previous](@previous)

/*:
 # Optionals
 [Optionals Swift Documentation](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
 
 You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.
 
 
 
 */


import Foundation
import SwiftUI
import PlaygroundSupport

let possibleNumber = "123"
// implied optional types
let convertedNumber = Int(possibleNumber)
print(type(of: convertedNumber))
print(type(of: possibleNumber))



/*:
 ### nil
 You set an optional variable to a valueless state by assigning it the special value nil:
 
 You can’t use nil with non-optional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.
 */

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

var surveyAnswer: String?
// surveyAnswer is automatically set to nil


/*:
 If Statements and Forced Unwrapping

 You can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=).
 */

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
} else {
    print(type(of: convertedNumber))
    // forced unwrapping with ! - default value for optional ??
    print(convertedNumber!)
}


if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}


/*:
 Optional Binding
 if let constantName = someOptional {
     statements
 
 You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.
 }
 */
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"



let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"


// SHORTHAND

if let myNumber = Int(possibleNumber){
    print("My number is \(myNumber)")
}


// Multiple Optional Bindings
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"


/*:
 Implicity Unwrapped Optionals
 use var instead of let to make the optional var mutable
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.

if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string."

if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."





/*
 Optional Chaining
 - [ ] https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html
 
 
 */


struct OptionalsView: View {
    var body: some View {
        Text("Playground Snippets Starter")
        
    }
}
        

PlaygroundPage.current.setLiveView(OptionalsView())






//: [Next](@next)
