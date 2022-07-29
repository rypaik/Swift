//: [Previous](@previous)

// Using ObservableObject and @EnvironmentObject
/*:
 suggested usage for @StateObject
    - child views withint their parent views need access to root level observable object
    - view which needs access to root level observable object
 
 
 
 */

import SwiftUI
// 1. Observable Object defined
// @Published makes class var announce changes

class PurchaseViewModel: ObservableObject{
    // 2. Property to observe and write to
    @Published var hasPurchasedSubscription: Bool = false
}

// @main needs to be included in app not Playground
//@main
struct TestProjectApp: App {
    // 3. Instance of source of truth create at the root
    @StateObject var vm = PurchaseViewModel()
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(vm)
            // 4. Modifier to pass in root source of truth to child view
        }
    }
}

struct ContentView: View {
    // 5. Property wrapper to receive adn accept root source of truth from parent (TestProjectApp)
    @EnvironmentObject var purchaseVm: PurchaseViewModel
    
    var body: some View {
        // 6. No need to inject environment object, since it is accessible via the parent (ContentView)
        PurchasedView()
    }
}


struct PurchasedView: View {
    // 7. Property wrapper to receive adn accent root source of truth from parent (ContentView)
    @EnvironmentObject var purchaseVm: PurchaseViewModel

    var body: some View {
        // 8. Read from the source of truth (PurchaseViewModel) from teh root (TestProjectApp) and reflect chagnes in UI
        Text(purchaseVm.hasPurchasedSubscription ? "User has Purchased" : "User has not Purchased")
    }
}


//: [Next](@next)

