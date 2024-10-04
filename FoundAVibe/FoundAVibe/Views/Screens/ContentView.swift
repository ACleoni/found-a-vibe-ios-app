//
//  ContentView.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        if session.user != nil {
                MainView()
            } else {
                NavigationStack {
                    WelcomeOne()
                }
            }
    }
}

#Preview {
    ContentView()
        .environmentObject(Session(authenticationService: FirebaseAuthenticationImpl()))
}
