//: [Previous](@previous)
/*:
 - [ ] Finish
[Protocol Documentation](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

 In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.
 
 */


import Foundation

procotol SomeProtocol {
    // property definition
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    
    var fullName: String { get }
    static var someTypeProperty: Int { get set }
    
    // method definition
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}


/*:
 ______
 #### Protocol Example with Properties
 */

protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName is "USS Enterprise"



/*:
 ______
 #### Protocol with Methods
 */

protocol SomeProtocol {
    static func someTypeMethod()
}



protocol RandomNumberGenerator {
    func random() -> Double
}




/*:
 _______
#### Example with Properties
*/

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"






/*:
 ______
 #### Protocol with Mutating Methods
 */



//: [Next](@next)
