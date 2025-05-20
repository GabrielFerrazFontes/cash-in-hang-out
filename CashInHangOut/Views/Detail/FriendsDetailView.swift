//
//  FriendsDetailView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct FriendsDetailView: View {
    let friend: FriendModel
    
    var body: some View {
        Text(friend.name)
    }
}

#Preview {
    let friend: FriendModel = FriendModel(
        id: .init(FriendModel.self),
        name: "Gabriel",
        debt: 10.0,
        photo: nil
    )
    FriendsDetailView(friend: friend)
}
