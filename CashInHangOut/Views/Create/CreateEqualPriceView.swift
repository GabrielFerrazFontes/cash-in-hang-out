//
//  CreateEqualPriceView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateEqualPriceView: View {
    @EnvironmentObject var viewModel: CreateEqualPriceViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            TextField("Total Price", text: $viewModel.totalValue.value)
                .keyboardType(.decimalPad)
                .disabled(viewModel.isDisabledTextField)
            Text("Each Person: \(viewModel.valueDivided, format: .currency(code: "BRL"))")
            FriendListMiniView()
                .environmentObject(viewModel.returnFriendListViewModel(.simpleFriend))
            NavigationLink {
                FriendListMiniView()
                    .environmentObject(viewModel.returnFriendListViewModel(.selectFriends))
            } label: {
                Text("Add Friends")
            }
            Button {
                viewModel.addHangOut()
                dismiss()
            } label: {
                Text("Create HangOut")
            }
        }
    }
}

#Preview {
    CreateEqualPriceView()
}
