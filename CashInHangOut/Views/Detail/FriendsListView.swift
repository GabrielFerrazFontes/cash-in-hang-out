//
//  FriendsListView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct FriendsListView: View {
    @EnvironmentObject var viewModel: FriendsListViewModel

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Friend.name, ascending: true)],
        animation: .default)
    private var friends: FetchedResults<Friend>
    
    var body: some View {
        NavigationStack {
            VStack {
                List(self.friends) { friend in
                    NavigationLink(value: friend) {
                        FriendCellNormal(friend: friend)
                            .environmentObject(viewModel.createCellViewModel())
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationDestination(for: Friend.self) { friend in
                    FriendsDetailView(friend: friend)
                        .environmentObject(viewModel.createDetailViewModel())
                }
                AddButtonView(creationType: .newFriend)
                    .environmentObject(viewModel.createAddButtonAction())
            }
        }
    }
}

#Preview {
    FriendsListView()
}
