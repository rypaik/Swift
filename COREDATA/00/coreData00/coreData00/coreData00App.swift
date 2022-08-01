//
//  coreData00App.swift
//  coreData00
//
//  Created by Jeen Byun on 7/18/22.
//

import SwiftUI

@main
struct coreData00App: App {
    let persistenceController = PersistenceController.shared

    @Environment(.\scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase{
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Scene fell into default mode")
            }
        }
    }
}
