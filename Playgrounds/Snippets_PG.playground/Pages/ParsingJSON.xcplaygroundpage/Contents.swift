//: [Previous](@previous)
/*:
 ## PARSE JSON
 */


/*:
 https://blog.techchee.com/json-parsing-and-examples-of-creating-views-in-loop-with-swiftui/
 https://developer.apple.com/documentation/foundation/jsondecoder
 
 ### SWIFT EXAMPLE DECODING JSON
 */


import Foundation


struct MenuItem : Codable, Identifiable {
    var id : Int
    var name : String
    var imageName : String
}

let json = """
[
   { "id": 1, "name" : "Apple TV", "imageName" : "appletv"},
   { "id": 2, "name" : "Apple Watch", "imageName" : "applewatch"},
   { "id": 3, "name" : "Car", "imageName" : "car"},
   { "id": 4, "name" : "iPhone", "imageName" : "iphone"}
]
""".data(using: .utf8)!
// .data(using: .utf8) added for working code

//let menuItems = try! JSONDecoder().decode([MenuItem].self, from: jsonData)

let decoder = JSONDecoder()
let menuItems = try decoder.decode([MenuItem].self, from: json)

menuItems.forEach { item in
    print(item.name)
    print(item.id)
}


//var greeting = "Hello, playground"

//: [Next](@next)
