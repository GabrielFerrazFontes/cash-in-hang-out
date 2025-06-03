//
//  HangOutDetailViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 02/06/25.
//

import Foundation

extension HangOutsDetailView {
    class HangOutsDetailViewModel: ObservableObject {
        private let hangOut: HangOut

        public var totalValue: String { hangOut.valueToString() }
        public var date: String { hangOut.date?.formatted() ?? "N/A" }
        public var friendList: [Friend] { hangOut.friendsList() }

        init(hangOut: HangOut) {
            self.hangOut = hangOut
        }

        func createFriendCellViewModel(friend: Friend) -> FriendCellNormal.FriendCellNormalViewModel {
            let individualValue = hangOut.totalValue / Float(hangOut.friendsList().count)
            return FriendCellNormal.FriendCellNormalViewModel(friend: friend, moneyDebt: individualValue)
        }
    }
}
