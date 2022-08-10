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
// IMAGE
            Image("google")
                //.renderingMode(.template)
                .resizable()
                //.aspectRatio(contentMode: .fit)
                //.scaledToFit()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .foregroundColor(.green)
                //.clipped()
                //.cornerRadius(150)
                //.clipShape(
                    //Circle()
                    //RoundedRectangle(cornerRadius: 25.0)
                    //Ellipse()
                //    Circle()
                //)
        }
    }
}

import PlaygroundSupport

PlaygroundPage.current.setLiveView(ContentView())
//PlaygroundPage.current.setLiveView(MenuView())



//: [Next](@next)
