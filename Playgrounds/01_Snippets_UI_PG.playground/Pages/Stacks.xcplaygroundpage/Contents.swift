//: [Previous](@previous)

import Foundation
import SwiftUI

struct ContentView: View {
    // Vstacks -> Vertical
    // Hstacks -> Horizontal
    // Zstacks -> zIndex (back to front)
    var body: some View {
        VStack(spacing: 50) {
            
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
            
        }
    }
}


import PlaygroundSupport

PlaygroundPage.current.setLiveView(ContentView())
//PlaygroundPage.current.setLiveView(MenuView())



//: [Next](@next)
