//: [Previous](@previous)


//: https://www.swiftbysundell.com/basics/protocols/

import Foundation

//protocol Likeable {
//    mutating func markAsLiked()
//}

//rewrite

protocol Likeable {
    var isLiked: Bool { get set }
}

extension Song: Likeable {
    mutating func markAsLiked() {
        isLiked = true
    }
}

extension Song: Likeable {}
extension Album: Likeable {}

//: [Next](@next)
