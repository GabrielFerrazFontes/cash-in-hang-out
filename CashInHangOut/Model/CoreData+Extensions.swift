//
//  CoreData+Extensions.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 02/06/25.
//

import Foundation

extension Friend {
    static let example: Friend = {
        let friend = Friend()
        friend.name = "Gabriel"
        friend.debt = 1000
        return friend
    }()

    func hangOutsList() -> [HangOut] {
        guard let hangOutSet = self.friendToHangOut as? Set<HangOut> else { return [] }
        return hangOutSet.map { $0 }
    }

    func valueToString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        guard let string = formatter.string(from: NSNumber(value: self.debt)) else { return "Error" }
        return string
    }
}

extension HangOut {
    static let example: HangOut = {
        let hangOut = HangOut()
        hangOut.date = Date()
        hangOut.hangType = 1
        hangOut.totalValue = 100
        return hangOut
    }()

    func friendsList() -> [Friend] {
        guard let friendSet = self.hangOutToFriend as? Set<Friend> else { return [] }
        return friendSet.map { $0 }
    }

    func valueToString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        guard let string = formatter.string(from: NSNumber(value: self.totalValue)) else { return "Error" }
        return string
    }
}
