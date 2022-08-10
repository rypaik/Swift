//: [Previous](@previous)

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Placeholder")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.green)
// ICONS
            Image(systemName: "person.fill.badge.plus")
                .renderingMode(.original)
                .font(.largeTitle)
                //.resizable()
                //.aspectRatio(contentMode: .fit)
                //.scaledToFit()
                //.scaledToFill()
                //.font(.caption)
                //.font(.system(size: 200))
                //.foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                //.frame(width: 300, height: 300)
                //.clipped()
        }
    }
}

import PlaygroundSupport

PlaygroundPage.current.setLiveView(ContentView())
//PlaygroundPage.current.setLiveView(MenuView())



//: [Next](@next)
