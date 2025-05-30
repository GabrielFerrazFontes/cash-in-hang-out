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
            FriendsListView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
                .environmentObject(FriendsListView.FriendsListViewModel(viewContext: viewContext))
            CreateHangView()
                .tabItem {
                    Label("Create", systemImage: "plus.circle.fill")
                }
                .environmentObject(CreateHangView.CreateHangViewModel(viewContext: viewContext))
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
