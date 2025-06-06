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
                .padding([.horizontal, .top])
                .font(.title2)
            Text("Each Person: \(viewModel.valueDivided, format: .currency(code: "BRL"))")
                .padding([.horizontal, .top])
                .font(.title2)
            FriendListMiniView()
                .environmentObject(viewModel.returnFriendListViewModel(.simpleFriend))
                .padding(.top)
            NavigationLink {
                FriendListMiniView()
                    .environmentObject(viewModel.returnFriendListViewModel(.selectFriends))
            } label: {
                ButtonLayoutView(text: "Add Friends")
            }
            Button {
                viewModel.addHangOut()
                dismiss()
            } label: {
                ButtonLayoutView(text: "Create HangOut")
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    CreateEqualPriceView()
}
