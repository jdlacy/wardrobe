//
//  WardrobeApp.swift
//  Wardrobe
//
//  Created by Jason on 4/2/22.
//

import SwiftUI
import Firebase

@main
struct WardrobeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = APPViewModel()
            ContentView()
                .environmentObject(viewModel)
            }
        }
    }

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
