//
//  HangOutsDetailView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct HangOutsDetailView: View {
    @EnvironmentObject var viewModel: HangOutsDetailViewModel
    @State var selectedFriends = Set<Friend>()

    var body: some View {
        VStack {
            Text(viewModel.date)
                .font(.title)
                .padding(.top)
                .accessibilityLabel("Date")
                .accessibilityHint("Date of the hangout")
            Text(viewModel.totalValue)
                .font(.largeTitle)
                .padding(.top)
                .accessibilityLabel("Total Value")
                .accessibilityHint("total value of the hangout")
            List(viewModel.friendList, id: \.self, selection: $selectedFriends) { friend in
                FriendCellNormal(showMoneyLabel: true)
                    .environmentObject(viewModel.createFriendCellViewModel(friend: friend))
            }
            .listStyle(GroupedListStyle())
            .padding([.top, .bottom])
            .environment(\.editMode, .constant(.active))
            .toolbar {
                Button("Pay") {
                    viewModel.payFriendSelection(selectedFriends)
                }
                .accessibilityLabel("Pay")
                .accessibilityHint("Edit button to set as paid by a friend")
            }
        }
    }
}

#Preview {
    HangOutsDetailView()
}
