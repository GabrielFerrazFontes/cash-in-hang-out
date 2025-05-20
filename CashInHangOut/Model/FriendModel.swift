//
//  FriendModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import Foundation

struct FriendModel: Identifiable, Hashable {
    var id: ObjectIdentifier
    let name: String
    let debt: Float
    let photo: Data?
}
