//
//  AppDelegate.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/21/24.
//
import os
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "FoundAVibe", category: "AppDelegate")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            try FirebaseConfig.configure()
            logger.info("Firebase successfully configured.")
        } catch {
            logger.error("Failed to configure Firebase: \(error.localizedDescription)")
        }
        return true
    }
}

