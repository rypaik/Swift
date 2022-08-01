//
//  SwiftUI_FirestoreApp.swift
//  SwiftUI_Firestore
//
//  Created by Jeen Byun on 6/28/22.
//

import SwiftUI
import Firebase
//import FirebaseAuth
//import FirebaseFirestore
//
class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
                            FirebaseApp.configure()
                            return true
                        }
}


@main
struct SwiftUI_FirestoreApp: App {
    let persistenceController = PersistenceController.shared
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    // Only need init on first run of app - cuasing double Firestore App Call
    init(){
//        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
