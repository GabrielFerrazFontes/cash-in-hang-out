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
            Text(viewModel.totalValue)
                .font(.largeTitle)
                .padding(.top)
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
            }
        }
    }
}

#Preview {
    HangOutsDetailView()
}
