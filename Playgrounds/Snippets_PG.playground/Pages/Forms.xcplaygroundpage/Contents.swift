//: [Previous](@previous)


import SwiftUI
import PlaygroundSupport


struct FormView: View {
    var body: some View {
        // forms can only contain 10
        // work around with Group and Section
        Form {
            Section{
                Group{
                    Text("Form Line")
                    Text("Form Line")
                    Text("Form Line")
                    Text("Form Line")
                    Text("Form Line")
                    Text("Form Line")
                }
            }
            Group {
                Text("Form Line")
                Text("Form Line")
                Text("Form Line")
                Text("Form Line")
                Text("Form Line")
                Text("Form Line")
            }
        }
    }
}
PlaygroundPage.current.setLiveView(FormView())

//: [Next](@next)
