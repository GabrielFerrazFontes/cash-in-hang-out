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
                    Section(header: Text("Friends")) {
                        ForEach(friends) { friend in
                            NavigationLink {
                                FriendsDetailView()
                                    .environmentObject(viewModel.createDetailViewModel(friend: friend))
                            } label: {
                                FriendCellNormal(showMoneyLabel: true)
                                    .environmentObject(viewModel.createCellViewModel(friend: friend))
                            }
                        }
                        .onDelete(perform: viewModel.removeFriends)
                    }
                    .headerProminence(.increased)
                }
                .listStyle(GroupedListStyle())
                .padding(.top)
                .frame(height: UIScreen.main.bounds.height * 0.75)
                AddButtonView(creationType: .newFriend)
                    .environmentObject(viewModel.createAddButtonAction())
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let viewContext = PersistenceController.shared.container.viewContext
    let viewModel = FriendsListView.FriendsListViewModel(viewContext: viewContext)
    FriendsListView()
        .environmentObject(viewModel)
}
