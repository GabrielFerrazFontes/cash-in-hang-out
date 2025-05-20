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
            VStack {
                List(viewModel.fetchFriends()) { friend in
                    NavigationLink(value: friend) {
                        Text(friend.name)
                    }
                    
                }
                .navigationDestination(for: FriendModel.self) { friend in
                    FriendsDetailView(friend: friend)
                }
                
                AddButtonView(creationType: .newFriend, viewModel: viewModel.createAddButtonAction())
            }
        }
    }
}

#Preview {
    let viewModel = FriendsListView.FriendsListViewModel()
    FriendsListView(viewModel: viewModel)
}
