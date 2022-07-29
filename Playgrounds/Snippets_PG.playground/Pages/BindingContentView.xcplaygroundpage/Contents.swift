//: [Previous](@previous)

//: @State and @Bindings Properties for Navigation


import Foundation
import SwiftUI
import PlaygroundSupport

struct BindingContentView: View {
    @State var textHolder = "Text Holder Property Init"
    
    var body: some View {
        VStack{
            Text("\(self.textHolder)")
            CustomButton1(textHolder: self.$textHolder)
            CustomButton2(textHolder: self.$textHolder)
        }
        
//        VStack {
////                Image(systemName: "Moon")
////                    .imageScale(.large)
////                    .foregroundColor(.accentColor)
////                Text("Property Wrappers")
////                Text("\(state_var)")
////
//    // @State - use this proeprty wrapper to update immutable vars in Structs
//
//
//
//
//    //            TextEditor(text: "State")
//    //    @State private var username =""        // insdie structs and classes
//
//
//
//    // @Published
//
//    // @ObservedObject
//    // @EnvironmentOBject
//
//        }
    }
}

struct CustomButton1: View {
    @Binding var textHolder: String
    var body: some View {
        Button("Cat Says") { self.textHolder = "MEOW"}
    }
}

struct CustomButton2: View {
    @Binding var textHolder: String
    var body: some View {
        Button("Dog Says") { self.textHolder = "WOOF"}
    }
}


PlaygroundPage.current.setLiveView(BindingContentView())






//: [Next](@next)
