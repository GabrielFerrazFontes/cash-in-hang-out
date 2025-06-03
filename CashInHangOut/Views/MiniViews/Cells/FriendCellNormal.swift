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
            Label(viewModel.moneyLabel(), systemImage: viewModel.iconType())
                .padding(.trailing)
                .foregroundStyle(viewModel.colorType())
        }
    }
}

extension FriendCellNormal {
    class FriendCellNormalViewModel: ObservableObject {
        let friend: FetchedResults<Friend>.Element
        var moneyDebt: Float?

        init(friend: FetchedResults<Friend>.Element, moneyDebt: Float? = nil) {
            self.friend = friend
            self.moneyDebt = moneyDebt
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

        func moneyLabel() -> String {
            let debt = moneyDebt ?? friend.debt
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            guard let string = formatter.string(from: NSNumber(value: debt)) else { return "Error" }
            return string
        }
    }
}

#Preview {
    let friend = Friend.example
    let viewModel = FriendCellNormal.FriendCellNormalViewModel(friend: friend)
    FriendCellNormal(showMoneyLabel: true)
        .environmentObject(viewModel)
}
