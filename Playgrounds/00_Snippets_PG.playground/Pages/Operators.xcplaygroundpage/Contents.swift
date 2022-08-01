//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: Unary Operator
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"


let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6





//: Ternary Operator
if question {
    answer1
} else {
    answer2
}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
// rowHeight is equal to 90



//: Comparison
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"




//: Nil coalescing Operator
a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"



//: Range Operators and Half Open Range oerators
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: Half Open Operators
//: Half-open ranges are particularly useful when you work with zero-based lists such as arrays,
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}


//: Open Sided Ranges
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}


for name in names[..<2] {
    print(name)
}




let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true


//: [Next](@next)
