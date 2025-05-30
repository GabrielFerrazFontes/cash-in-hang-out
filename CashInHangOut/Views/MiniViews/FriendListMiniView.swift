//
//  FriendListView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 21/05/25.
//

import SwiftUI

struct FriendListMiniView: View {
    @State var selectedFriends = Set<Friend>()

    @EnvironmentObject var viewModel: FriendListMiniViewModel
    @Environment(\.dismiss) var dismiss
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Friend.name, ascending: true)],
        animation: .default)
    private var friends: FetchedResults<Friend>

    var body: some View {
        NavigationStack {
            List(viewModel.allFriends, id: \.self, selection: $selectedFriends) { friend in
                createCell(friend: friend)
                    .environmentObject(viewModel)
            }
            .environment(\.editMode, .constant(viewModel.returnEditMode()))
            .toolbar {
                createToolbarButton()
            }
            .onAppear {
                viewModel.updateFriendList(friends)
            }
        }
    }
    
    @ViewBuilder func createCell(friend: Friend) -> some View {
        switch viewModel.type {
        case .editableFriend:
            Text("in production")
        case .selectFriends:
            let viewModel = FriendCellNormal.FriendCellNormalViewModel(friend: friend)
            FriendCellNormal(showMoneyLabel: true)
                .environmentObject(viewModel)
        case .simpleFriend:
            let viewModel = FriendCellNormal.FriendCellNormalViewModel(friend: friend)
            FriendCellNormal(showMoneyLabel: false)
                .environmentObject(viewModel)
        }
    }
    
    @ViewBuilder func createToolbarButton() -> some View {
        if viewModel.type == .selectFriends {
            Button("Done") {
                viewModel.updateAction(selectedFriends.map { $0 })
                dismiss()
            }
        }
    }
}

#Preview {
    FriendListMiniView()
}
