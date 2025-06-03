//
//  CreateEqualPriceViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 21/05/25.
//

import SwiftUI
import CoreData

extension CreateEqualPriceView {
    class CreateEqualPriceViewModel: ObservableObject {
        private let viewContext: NSManagedObjectContext
        private let listViewModel = FriendListMiniView.FriendListMiniViewModel(type: .simpleFriend)
        private let listSelectViewModel = FriendListMiniView.FriendListMiniViewModel(type: .selectFriends)
        private var selectedFriends: [Friend] = []

        @Published var isDisabledTextField: Bool = true
        @Published var valueDivided: Float = 0.0
        @Published var totalValue: NumbersOnly = NumbersOnly() {
            didSet {
                let value = try? Float(totalValue.value, format: .number)
                valueDivided = (value ?? 0.0) / Float(selectedFriends.count)
            }
        }

        init (viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }

        func updateSelection(_ selection: [Friend]) {
            isDisabledTextField = selection.isEmpty
            selectedFriends = selection
            listViewModel.updateFriendList(selection)
        }

        func returnFriendListViewModel(_ type: FriendListMiniView.FriendListMiniType) -> FriendListMiniView.FriendListMiniViewModel {
            listSelectViewModel.updateAction = updateSelection(_:)
            if type == .selectFriends { return listSelectViewModel }
            return listViewModel
        }

        func addHangOut() {
            let newHangOut = HangOut(context: viewContext)
            newHangOut.date = Date()
            newHangOut.hangOutToFriend = Set(selectedFriends) as NSSet
            newHangOut.hangType = Int16(HangType.equalPrice.rawValue)
            newHangOut.totalValue = (try? Float(totalValue.value, format: .number)) ?? 0.0
            
            for friend in selectedFriends {
                friend.debt += valueDivided
                friend.addToFriendToHangOut(newHangOut)
            }
            do {
                try viewContext.save()
            } catch {
                // cant create a new hang out (Show a popup)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
