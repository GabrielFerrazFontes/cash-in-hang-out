//
//  HangOutDetailViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 02/06/25.
//

import CoreData

extension HangOutsDetailView {
    class HangOutsDetailViewModel: ObservableObject {
        private let hangOut: HangOut
        private let viewContext: NSManagedObjectContext
        private var individualValue: Float {
            hangOut.totalValue / Float(hangOut.friendsList().count)
        }

        public var totalValue: String { hangOut.valueToString() }
        public var date: String { hangOut.date?.formatted() ?? "N/A" }
        @Published public var friendList: [Friend]

        init(hangOut: HangOut, viewContext: NSManagedObjectContext) {
            self.hangOut = hangOut
            self.viewContext = viewContext
            self.friendList = hangOut.friendsList()
        }

        func createFriendCellViewModel(friend: Friend) -> FriendCellNormal.FriendCellNormalViewModel {
            FriendCellNormal.FriendCellNormalViewModel(friend: friend, moneyDebt: individualValue)
        }

        func payFriendSelection(_ friends: Set<Friend>) {
            let friendList = Array(friends)

            for friend in friendList {
                friend.debt -= individualValue
            }
            do {
                try viewContext.save()
                self.friendList = friendList
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
