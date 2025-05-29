//
//  CreateEqualPriceViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 21/05/25.
//

import SwiftUI

extension CreateEqualPriceView {
    class CreateEqualPriceViewModel: ObservableObject {
        let listViewModel = FriendListMiniView.FriendListMiniViewModel(type: .simpleFriend)
        let listSelectViewModel = FriendListMiniView.FriendListMiniViewModel(type: .selectFriends)

        func updateSelection(_ selection: [Friend]) {
            listViewModel.updateFriendList(selection)
        }
        
        func returnFriendListViewModel(_ type: FriendListMiniView.FriendListMiniType) -> FriendListMiniView.FriendListMiniViewModel {
            listSelectViewModel.updateAction = updateSelection(_:)
            if type == .selectFriends { return listSelectViewModel }
            return listViewModel
        }
    }
}
