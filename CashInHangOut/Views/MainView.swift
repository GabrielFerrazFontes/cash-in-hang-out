//
//  MainView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        TabView {
            HangOutsListView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
                .environmentObject(HangOutsListView.HangOutsListViewModel(viewContext: viewContext))
                .accessibilityLabel("History")
                .accessibilityHint("History of hangouts")
            FriendsListView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
                .environmentObject(FriendsListView.FriendsListViewModel(viewContext: viewContext))
                .accessibilityLabel("Friends")
                .accessibilityHint("List of friends")
            CreateHangView()
                .tabItem {
                    Label("Create", systemImage: "plus.circle.fill")
                }
                .environmentObject(CreateHangView.CreateHangViewModel(viewContext: viewContext))
                .accessibilityLabel("Create")
                .accessibilityHint("Create new hangout")
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .accessibilityLabel("Settings")
        }
    }
}

#Preview {
    MainView()
}
