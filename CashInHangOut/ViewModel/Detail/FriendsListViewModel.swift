//
//  FriendsListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

extension FriendsListView {
    class FriendsListViewModel: ObservableObject {
        // Core Data
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Friend.name, ascending: true)],
            animation: .default)
        private var friends: FetchedResults<Friend>
        
        func fetchFriends() -> [FriendModel] {
            friends.map { friend in
                let newFriend = FriendModel(
                    id: friend.id,
                    name: friend.name ?? "Unknown",
                    debt: friend.debt,
                    photo: friend.photo
                )
                return newFriend
            }
        }
    }
}
