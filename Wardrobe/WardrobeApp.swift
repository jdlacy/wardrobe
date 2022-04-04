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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
