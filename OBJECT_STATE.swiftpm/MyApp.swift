import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
//            Text("Contentview")
//                .bold()
//                .font(.headline)
//            Text("Hello World Module")
//            ContentView()
            
            
//            Text("StateVarView")
//                .bold()
//                .font(.headline)
//            Text("@State Property Wrappers")
//            stateVarView()
//
//            Text("TwoBindStructView")
//                .bold()
//                .font(.headline)
//            Text("Two Way Binding Structs")
//            TwoBindStructView()
//
//            Spacer()
//            Text("TwoWayBindClassView")
//                .bold()
//                .font(.headline)
//            Text("Two Way Binding Classes")
//            TwoWayBindClassView()
//
//            Text("TwoWayMultiBindClassView")
//                .bold()
//                .font(.headline)
//            Text("Two Way Binding Classes")
            TwoWayMultiBindClassView()
            
//             ()
        }
    }
}




struct MyApp_Preview: PreviewProvider {
    static var previews: some View {
        TwoWayBindClassView()
//        NextScreen()
    }
}



