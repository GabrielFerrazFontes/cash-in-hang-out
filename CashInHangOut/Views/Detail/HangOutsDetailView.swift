//
//  HangOutsDetailView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct HangOutsDetailView: View {
    @EnvironmentObject var viewModel: HangOutsDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.date)
            Text(viewModel.totalValue)
            List {
                ForEach(viewModel.friendList) { friend in
                    FriendCellNormal(showMoneyLabel: true)
                        .environmentObject(viewModel.createFriendCellViewModel(friend: friend))
                }
            }
        }
    }
}

#Preview {
    HangOutsDetailView()
}
