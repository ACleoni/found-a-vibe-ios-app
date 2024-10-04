//
//  MainView.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/4/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Text("Home View")
                .tabItem {
                    Label("", systemImage: "house")
                }
        
            Text("Chat Rooms")
                .tabItem {
                    Label("", systemImage: "message")
                }
            
            
            Text("Liked Events")
                .tabItem {
                    Label("", systemImage: "heart")
                }
            
            Text("Profile")
                .tabItem {
                    Label("", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
