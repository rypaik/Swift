//: [Previous](@previous)

/*:
 This Snippets Renders a Basic Navigation View with Menu Buttons
 Menu Page
    |--> Button -> Struct with var body: -> View with Back Button
    |--> Button -> Struct with var body: -> View with Back Button
 
 */

import PlaygroundSupport
import SwiftUI



struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Playground Snippets")
                    .navigationTitle("Navigation")
                NavigationLink(destination: SecondView(), label: { Text("Second")
                                   .bold()
                                   .frame(width: 280, height: 50)
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                })
                    NavigationLink(destination: SecondView(), label: { Text("Second")
                                       .bold()
                                       .frame(width: 280, height: 50)
                                       .background(Color.blue)
                                       .foregroundColor(.white)
                                       .cornerRadius(10)
                    })
            }
        }
    }
}

struct SecondView: View {
    @State private var score = 0
    public var body: some View {
        Text("Second Page")
    }
    
}
// Takeout - from another NavigationView
//NavigationView {
//            Text("Score: \(score)")
//                .navigationTitle("Navigation")
//                .navigationBarItems(
//                    trailing:
//                        Button("Add 1") {
//                            self.score += 1
//                        }
//                )
//        }


PlaygroundPage.current.setLiveView(MenuView())

//: [Next](@next)
