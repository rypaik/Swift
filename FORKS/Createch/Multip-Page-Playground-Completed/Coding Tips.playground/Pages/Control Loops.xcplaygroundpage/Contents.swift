/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Control Loops
 In this page, I will be showing examples of how to loop through collections.
*/
import Foundation
/*:
 - Callout(Looping through Arrays): Show three more ways to loop through the integers from 1 through 10, printing only even numbers.
 ```
 for num in 1...10 {
    if num % 2 == 0 {
        print(num)
    }
 }
 ```
 ---
*/
code(for: "Example 1") {
    (1...10).forEach {
        if $0 % 2 == 0 {
            print($0)
        }
    }
}

code(for: "Example 2") {
    (1...10).filter{$0 % 2 == 0}.forEach {
        print($0)
    }
}

code(for: "Example 3") {
    stride(from: 2, through: 10, by: 2).forEach {
        print($0)
    }
}
