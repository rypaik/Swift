//
//  Closures.swift
//  Snippets
//
//  Created by Jeen Byun on 7/7/22.
//
// closures are functions wrapped in a var

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

