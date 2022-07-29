

import SwiftUI

struct ContentView: View {
  @State private var showAddThing = false
  @EnvironmentObject private var myThings: ThingStore

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        if myThings.things.isEmpty {
          Text("Add acronyms you learn")
            .foregroundColor(.gray)
        }
        ForEach(myThings.things) { thing in   // 1
          NavigationLink(destination: ThingView(thing: thing)) {
            Text(thing.short)
          }
        }
        Spacer()
      }
      .sheet(isPresented: $showAddThing) {
        AddThingView()
      }
      .navigationTitle("TIL")
      .toolbar {
        ToolbarItem {
          // swiftlint:disable:next multiple_closures_with_trailing_closure
          Button(action: { showAddThing.toggle() }) {
            Image(systemName: "plus.circle")
              .font(.title)
          }
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ThingStore())
  }
}
