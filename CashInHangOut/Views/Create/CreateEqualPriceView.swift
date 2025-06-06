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
                .accessibilityLabel("Total Price")
                .accessibilityHint("Insert the total price of the hangout")
            Text("Each Person: \(viewModel.valueDivided, format: .currency(code: "BRL"))")
                .padding([.horizontal, .top])
                .font(.title2)
                .accessibilityLabel("Price per person")
                .accessibilityHint("The price each person will pay")
            FriendListMiniView()
                .environmentObject(viewModel.returnFriendListViewModel(.simpleFriend))
                .padding(.top)
            NavigationLink {
                FriendListMiniView()
                    .environmentObject(viewModel.returnFriendListViewModel(.selectFriends))
            } label: {
                ButtonLayoutView(text: "Add Friends")
                    .accessibilityLabel("Add Friends")
                    .accessibilityHint("Add Friends to the hangout")
            }
            Button {
                viewModel.addHangOut()
                dismiss()
            } label: {
                ButtonLayoutView(text: "Create Hang Out")
            }
            .accessibilityLabel("Create Hang Out")
            .accessibilityHint("Create a new hangout")
            .padding(.bottom)
        }
    }
}

#Preview {
    CreateEqualPriceView()
}
