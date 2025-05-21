//
//  FriendCellNormal.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

struct FriendCellNormal: View {
    let friend: FetchedResults<Friend>.Element
    @EnvironmentObject var viewModel: FriendCellNormalViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
                .padding(.horizontal)
            Text(friend.name ?? "Unkonwn")
            Spacer()
            Label("\(friend.debt, format: .currency(code: "BRL"))", systemImage: viewModel.iconType(value: friend.debt))
                .padding(.trailing)
                .foregroundStyle(viewModel.colorType(value: friend.debt))
        }
    }
}

extension FriendCellNormal {
    class FriendCellNormalViewModel: ObservableObject {
        func iconType(value: Float) -> String {
            switch value {
            case _ where value > 0:
                "multiply.circle.fill"
            case _ where value < 0:
                "plus.circle.fill"
            default:
                "minus.circle.fill"
            }
        }
        
        func colorType(value: Float) -> Color {
            switch value {
            case _ where value > 0:
                .red
            case _ where value < 0:
                .green
            default:
                .black
            }
        }
    }
}

#Preview {
    let friend = Friend.example
    let viewModel = FriendCellNormal.FriendCellNormalViewModel()
    FriendCellNormal(friend: friend)
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
