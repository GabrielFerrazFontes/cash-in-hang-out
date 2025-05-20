//
//  FriendsListView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct FriendsListView: View {
    let viewModel: FriendsListViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.fetchFriends()) { friend in
                NavigationLink(value: friend) {
                    Text(friend.name)
                }
            }
            .navigationDestination(for: FriendModel.self) { friend in
                FriendsDetailView(friend: friend)
            }
            
        }
    }
}

#Preview {
    let viewModel = FriendsListView.FriendsListViewModel()
    FriendsListView(viewModel: viewModel)
}
