//
//  FoundAVibeApp.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/20/24.
//

import SwiftUI
import Firebase

@main
struct FoundAVibeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showAlert: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if FirebaseApp.app() == nil {
                        showAlert.toggle()
                    }
                }
                .alert(isPresented: $showAlert) {
                    let message = "Please try again later. If the problem persists, please contact support@foundavibe.com."
                    return Alert(
                        title: Text("Failed to Load Database Configuration"),
                        message: Text(message),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
    }
}
