//: [Previous](@previous)

// < IOS13 suggested Using ObservedObject

/*:
 ObservedObject: @Published var -> @StateObject in View -> @ObservedObject in child View
 suggested usage for @StateObject
    - Child View needs access to a state object from a single view, pass down using observable object
    - if < iOS14 create an insatnce of observable object
 
 */


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
        PeopleView(vm: vm)
    }
}


// PeopleView is child view of ContentView()
struct PeopleView: View {
    @ObservedObject var vm: PeopleViewModel
   
    var body: some View {
        Text("Number of users: \(vm.items.count)")
    }
}

//: [Next](@next)
