//
//  FriendCellNormal.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

struct FriendCellNormal: View {
    @EnvironmentObject var viewModel: FriendCellNormalViewModel
    let showMoneyLabel: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
                .padding(.horizontal)
            Text(viewModel.friend.name ?? "Unkonwn")
            Spacer()
            moneyLabel()
        }
    }
    
    @ViewBuilder func moneyLabel() -> some View {
        if showMoneyLabel {
            Label("\(viewModel.friend.debt, format: .currency(code: "BRL"))", systemImage: viewModel.iconType())
                .padding(.trailing)
                .foregroundStyle(viewModel.colorType())
        }
    }
}

extension FriendCellNormal {
    class FriendCellNormalViewModel: ObservableObject {
        let friend: FetchedResults<Friend>.Element

        init(friend: FetchedResults<Friend>.Element) {
            self.friend = friend
        }
        
        func iconType() -> String {
            switch friend.debt {
            case _ where friend.debt > 0:
                "multiply.circle.fill"
            case _ where friend.debt < 0:
                "plus.circle.fill"
            default:
                "minus.circle.fill"
            }
        }
        
        func colorType() -> Color {
            switch friend.debt {
            case _ where friend.debt > 0:
                .red
            case _ where friend.debt < 0:
                .green
            default:
                .black
            }
        }
    }
}

#Preview {
    let friend = Friend.example
    let viewModel = FriendCellNormal.FriendCellNormalViewModel(friend: friend)
    FriendCellNormal(showMoneyLabel: true)
        .environmentObject(viewModel)
}

extension Friend {
    static let example: Friend = {
        let friend = Friend()
        friend.name = "Gabriel"
        friend.debt = 1000
        return friend
    }()
}
