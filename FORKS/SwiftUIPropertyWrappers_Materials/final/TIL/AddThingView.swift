
import SwiftUI

struct AddThingView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var someThings: ThingStore
  // @EnvironmentObject replaces @Binding var SomeThings: ThingStore
  @State private var short = ""
  @State private var long = ""

  private func saveAndExit() {
    if !short.isEmpty {
      someThings.things.append(
        Thing(short: short, long: long))
    }
    presentationMode.wrappedValue.dismiss()
  }

  var body: some View {
    VStack {
      TextField("TIL", text: $short)   // 1
        .disableAutocorrection(true)
        .autocapitalization(.allCharacters)   // 2
      TextField(
        "Thing I Learned",
        text: $long,
        onEditingChanged: { _ in },
        onCommit: { saveAndExit() }
      )
      .autocapitalization(.words)
      Button("Done") {
        saveAndExit()
      }
      Spacer()
    }
    .padding()
    .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct AddThingView_Previews: PreviewProvider {
  static var previews: some View {
    AddThingView()
      .environmentObject(ThingStore())
  }
}
