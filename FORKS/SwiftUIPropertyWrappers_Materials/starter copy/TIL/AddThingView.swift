import SwiftUI

struct AddThingView: View {
  @Environment(\.presentationMode) var presentationMode
  @Binding var someThings: ThingStore
    
  var body: some View {
      VStack {
      Button("Done") {
        presentationMode.wrappedValue.dismiss()
        someThings.things.append("FOMO")
      }
      Spacer()
    }
  }
}

struct AddThingView_Previews: PreviewProvider {
  static var previews: some View {
      AddThingView(someThings: .constant(ThingStore()))
  }
}
