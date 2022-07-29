//: [Previous](@previous)

import SwiftUI

struct ContentView: View {
    var body: some View{
        Text("Hello World")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .navigationTitle("Page Title")
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

//: [Next](@next)
