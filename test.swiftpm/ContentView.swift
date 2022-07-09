import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: SecondSnippetsView(), label: { Text("Next Screen")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            })
        }
    }
}


