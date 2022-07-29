
import SwiftUI

final class ThingStore: ObservableObject {
  @Published var things: [Thing] = []
}

struct Thing: Identifiable {
  let id = UUID()   // 2
  let short: String
  let long: String
}
