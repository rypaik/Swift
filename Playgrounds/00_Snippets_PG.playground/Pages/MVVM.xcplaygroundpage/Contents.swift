//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

//: https://developer.apple.com/documentation/combine/observableobject

/*:
 By default an ObservableObject synthesizes an objectWillChange publisher that emits the changed value before any of its @Published properties changes.
 */

//: ### MVVMApp.swift


//: # MODEL
struct Person {
    var name: String
    var birthday: Date
    var age: String
}


//: # VIEWMODELS
//: ### ContentViewModel.swift
// 1. ObservableObject Broadcasts changes in class instances
// 2. Codable - enables decodable and encodable protocols like JSONDecoder()
// 3. Identifiable - enables UUID variable and assignment

class ContentViewModel: ObservableObject {
    //@Published makes var mutatable
    @Published private var alice = Person(name:"Alice", birthday: Date(), age: "44")

    var name: String {
        alice.name
    }
    
    var age: String {
        // date magic -> age string
//        return "32"
        alice.age
    }
    
    func changeName(_ name: String){
        alice.name = name
        
    }
    
    func changeAge(_ age: String){
        alice.age = age
    }
    
}


//: # VIEWS
//: ### ContentView.swift
struct ContentView: View {
    // variables and connection properties outside of views
    // let alice = Person(name: "Alice", birthday: Date()) - coder protoype
    
    // Connecting viewModel Variable to ObservableObject instance viewModel
    // TODO: Find difference between @ObservedObject and @StateObject
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack{
//            Text(alice.name) - prototyping
            Text(viewModel.name)
                .padding()
//            Text(String(alice.age)) - protoyping
            Button("Change Age"){
                viewModel.changeAge("55")
            }
            Text(viewModel.age)
                .padding()
            Button("Change name"){
                viewModel.changeName("Bob")
            }
        }.font(.largeTitle)
    }
}


// import PlaygroundSupport
PlaygroundPage.current.setLiveView(ContentView())


//: ###


//: [Next](@next)
