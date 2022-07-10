//: [Previous](@previous)
//: https://www.youtube.com/watch?v=8W3DqPZoHw4&ab_channel=iOSAcademy
//: Building a Custom Property Wrapper



import Foundation
import UIKit
import SwiftUI

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
}

func shouldShowOnboardingUI(){
    if UserDefaults.standard.bool(forKey: "hasOnBoarded") {
        // show app
    } else {
        ///
    }
}

//: [Next](@next)
