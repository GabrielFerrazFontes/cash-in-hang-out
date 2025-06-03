//
//  FriendsListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI
import CoreData

extension FriendsListView {
    class FriendsListViewModel: ObservableObject {
        private let viewContext: NSManagedObjectContext
        private var friends: [Friend] = []

        init(viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
            updateFriendList()
        }

        func updateFriendList() {
            let fetchRequest: NSFetchRequest<Friend> = Friend.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Friend.name, ascending: true)]
            friends = (try? viewContext.fetch(fetchRequest)) ?? []
        }

        func removeFriends(at offset: IndexSet) {
            for index in offset {
                let friendToDelete = friends[index]
                viewContext.delete(friendToDelete)
            }
            do {
                try viewContext.save()
                updateFriendList()
            } catch {
                // present popup
                print("error at deleting friend: \(error)")
            }
        }

        func createAddButtonAction() -> AddButtonView.AddButtonViewModel {
            return .init(viewContext: viewContext)
        }

        func createCellViewModel(friend: FetchedResults<Friend>.Element) -> FriendCellNormal.FriendCellNormalViewModel {
            return .init(friend: friend)
        }

        func createDetailViewModel(friend: Friend) -> FriendsDetailView.FriendsDetailViewModel {
            return .init(friend: friend)
        }
    }
}
