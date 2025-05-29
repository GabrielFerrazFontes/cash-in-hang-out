//
//  CreateEqualPriceView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateEqualPriceView: View {
    @ObservedObject private var totalValue = NumbersOnly()
    @EnvironmentObject var viewModel: CreateEqualPriceViewModel
    
    var body: some View {
        VStack {
            TextField("Total Price", text: $totalValue.value)
                .keyboardType(.decimalPad)
            FriendListMiniView()
                .environmentObject(viewModel.returnFriendListViewModel(.simpleFriend))
            NavigationLink {
                FriendListMiniView()
                    .environmentObject(viewModel.returnFriendListViewModel(.selectFriends))
            } label: {
                Text("Add Friends")
            }

        }
    }
}

#Preview {
    CreateEqualPriceView()
}
