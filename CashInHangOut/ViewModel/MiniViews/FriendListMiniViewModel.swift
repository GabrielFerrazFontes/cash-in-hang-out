//
//  FriendListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 21/05/25.
//

import SwiftUI

extension FriendListMiniView {
    public enum FriendListMiniType {
        case simpleFriend
        case editableFriend
        case selectFriends
    }
    
    class FriendListMiniViewModel: ObservableObject {
        var type: FriendListMiniType
        var selectionFriends: [Friend]? = [Friend]()
        @Published var allFriends = [Friend]()
        var updateAction: (_ friends: [Friend]) -> Void = { _ in }
        
        init(type: FriendListMiniType) {
            self.type = type
        }
        
        func updateFriendList(_ friends: FetchedResults<Friend>) {
            let friendList = friends.map { $0 }
            if type == .simpleFriend { return }
            updateFriendList(friendList)
        }
        
        func updateFriendList(_ friends: [Friend]) {
            switch type {
            case .editableFriend:
                allFriends = []
            case .simpleFriend:
                allFriends = friends
            case .selectFriends:
                allFriends = friends
            }
        }
        
        func returnEditMode() -> EditMode {
            switch type {
            case .editableFriend, .selectFriends:
                return .active
            case .simpleFriend:
                return .inactive
            }
        }
    }
}
