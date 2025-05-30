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
                List {
                    ForEach(friends) { friend in
                        NavigationLink {
                            FriendsDetailView(friend: friend)
                                .environmentObject(viewModel.createDetailViewModel())
                        } label: {
                            FriendCellNormal(showMoneyLabel: true)
                                .environmentObject(viewModel.createCellViewModel(friend: friend))
                        }
                    }
                    .onDelete(perform: viewModel.removeFriends)
                }
                .listStyle(GroupedListStyle())
                AddButtonView(creationType: .newFriend)
                    .environmentObject(viewModel.createAddButtonAction())
            }
        }
    }
}

#Preview {
    FriendsListView()
}
