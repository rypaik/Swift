import SwiftUI


// structs are immutable - they can call functions - cannot change variables in it unless wrapped in @State property
struct ContentView: View {
    // var that can represent state
    // must wrap isAuthenticated with State property to make it mutable in struct
    @State var isAuthenticated = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            
            //adding state variable
            Button(action:{
                self.isAuthenticated.toggle()
            })
            {Text("Toggle Authentication")}
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
