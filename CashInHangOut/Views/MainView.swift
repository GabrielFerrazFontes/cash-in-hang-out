//
//  MainView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HangOutsListView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
            FriendsListView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
            CreateHangView()
                .tabItem {
                    Label("Create", systemImage: "plus.circle.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
