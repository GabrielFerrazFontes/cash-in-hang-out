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
            CreateHangView()
                .tabItem {
                    Label("Create", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}
