//: [Previous](@previous)
//: TODO: Review and Notate
//: TODO: Protocol review

import Foundation

//: Protocol for Piroritized

protocol Prioritized {
    var priority: Int { get }
    func alertIfImportant()
}

struct Work: Prioritized {
    let priority: Int

    func alertIfImportant() {
        if priority > 3 {
            print("I'm important work!")
        }
    }
}

struct Document: Prioritized {
    let priority: Int

    func alertIfImportant() {
        if priority > 5 {
            print("I'm an important document!")
        }
    }
}


//func checkPriority(of item: Prioritized) {
//    print("Checking priority…")
//    item.alertIfImportant()
//}

func checkPriority<P: Prioritized>(of item: P) {
    print("Checking priority…")
    item.alertIfImportant()
}

count(numbers: [1, 2, 3])
count(numbers: [1.5, 2.5, 3.5])

//: [Next](@next)
