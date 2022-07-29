////: [Previous](@previous)
////: https://www.youtube.com/watch?v=8W3DqPZoHw4&ab_channel=iOSAcademy
////: Building a Custom Property Wrapper
//
//
//
//import Foundation
//import UIKit
//import SwiftUI
//
//
///*:
// ## @EnvironmentObject
// An @EnvironmentObject is an object living in the current environment, available to read whenever needed. An environment object is defined at a higher-level view, and can any child view can access it if needed.
// https://www.avanderlee.com/swiftui/environmentobject/
// */
//
////@EnvironmentObject
//final class Theme: ObservableObject {
//    @Published var primaryColor: Color = .orange
//}
//
//struct ArticlesListView: View {
//    @EnvironmentObject var theme: Theme
//
//    var body: some View{
//        // implement
//    }
//}
//
//struct EnvironmentObjectsExampleApp: App {
//    @StateObject var currentTheme = Theme()
//    
//    var body: some Scene {
//        WindowGroup {
//            ArticlesListView()
//                .environmentObject(currentTheme) // Make the theme available through the environment.
//            Text(article.title)
//                .foregroundColor(theme.primaryColor)
//            
//        }
//    }
//}
//
///*:
// Property Wrapper
// - [] TODO: https://www.avanderlee.com/swift/property-wrappers/
// 
// property wrapper is an extra layer that defines how a property is stored or computed on reading. It’s beneficial for replacing repetitive code found in getters and setters of properties.
// */
//
//
//// Property Wrappers and UserDefaults
//
//extension UserDefaults {
//
//    
////    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
////    static var hasSeenAppIntroduction: Bool
//    
//    public enum Keys {
//        static let hasSeenAppIntroduction = "has_seen_app_introduction"
//    }
//
//    /// Indicates whether or not the user has seen the onboarding.
//    var hasSeenAppIntroduction: Bool {
//        set {
//            set(newValue, forKey: Keys.hasSeenAppIntroduction)
//        }
//        get {
//            return bool(forKey: Keys.hasSeenAppIntroduction)
//        }
//    }
//}
//
/////
//UserDefaults.standard.hasSeenAppIntroduction = true
//
//guard !UserDefaults.standard.hasSeenAppIntroduction else { return }
//showAppIntroduction()
//
//
//
//// CREATING A PROPERTYWRAPPER
//@propertyWrapper
//struct UserDefault<Value> {
//    let key: String
//    let defaultValue: Value
//    var contaienr: UserDefaults = .standard
//    
//    var wrappedValue: Value {
//        
//    }
//}
//
////}
////
////func shouldShowOnboardingUI(){
////    if UserDefaults.standard.bool(forKey: "hasOnBoarded") {
////        // show app
////    } else {
////        ///
////    }
////}
//
////: [Next](@next)
