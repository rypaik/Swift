//: [Previous](@previous)

// Using Observable Object and @StateObject
/*:
 suggested usage for @StateObject
    - a source of truth taht is only needed for taht one single view
    - building a source of truth to be used at the root of the application
    - making an instance of the ObservabelObject
 */
// Single View Instance of Observable Object

import SwiftUI

// 1. Observable Object defined
// @Published makes class var announce changes
class PeopleViewModel: ObservableObject{
    @Published var items: [String] = []
}

struct ContentView: View {
    // 2. Instance of source of truth created in relevant view
    // @StateObject only creates one instance
    @StateObject private var vm = PeopleViewModel()
    
    var body: some View {
        //3. Read from source of Truth - PeopleViewModel() and reflect changes in UI
        Text("Number of Users: \(vm.items.count)")
    }
}


//: [Next](@next)
