//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            if isOn {
                Text("Switch is on")
            } else {
                Text("Switch is off")
            }
            
            Text(isOn ? "Switch is On-Ter" : "Switch is off-Ter")
            
            Button {
                isOn.toggle()
            } label: {
                Text("Toggle Me")
            }
            
            Image(systemName: "lightbulb")
                .font(.largeTitle)
                .symbolVariant(isOn ? .fill : .none)
                .foregroundColor(isOn ? .yellow : .black)
            
            Toggle(isOn: $isOn) {
                Text("Toggle Light Switch")
            }
            .labelsHidden()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
