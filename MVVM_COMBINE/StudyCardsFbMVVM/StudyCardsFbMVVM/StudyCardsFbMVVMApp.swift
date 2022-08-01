//
//  StudyCardsFbMVVMApp.swift
//  StudyCardsFbMVVM
//
// Created by Jeen Byun on 7/5/22.
// https://www.youtube.com/watch?v=gSOqyuPDKqo&ab_channel=BeyondOnesAndZeros
// STATUS: WORKING
// TODO: fix stars and passed card status

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct StudyCardsFbMVVMApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

//    let persistenceController = PersistenceControl   ler.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
            }
        }
    }
}
