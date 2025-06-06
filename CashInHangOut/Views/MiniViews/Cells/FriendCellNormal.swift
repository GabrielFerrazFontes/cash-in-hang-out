//
//  FriendCellNormal.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI
import UIKit

struct FriendCellNormal: View {
    @EnvironmentObject var viewModel: FriendCellNormalViewModel
    let showMoneyLabel: Bool

    var body: some View {
        HStack {
            createImage()
            createMoneyIcon()
                .padding(.leading)
            VStack(alignment: .leading) {
                Text(viewModel.friendName)
                    .accessibilityLabel("Name")
                    .accessibilityHint("Friends name")
                createMoneyLabel()
            }
            .padding(.leading)
        }
    }

    @ViewBuilder func createImage() -> some View {
        if viewModel.hasPhoto {
            viewModel.createImage().resizable().scaledToFill().frame(
                width: DesignSystem.DSSize.photoSize,
                height: DesignSystem.DSSize.photoSize
            )
                .frame(width: DesignSystem.DSSize.photoSize, height: DesignSystem.DSSize.photoSize)
                .padding(.horizontal)
                .clipShape(Circle())
                .accessibilityLabel("Friend photo")
        } else {
            Image(systemName: "person.circle")
                .foregroundColor(.blue)
                .frame(width: DesignSystem.DSSize.photoSize, height: DesignSystem.DSSize.photoSize)
                .padding(.horizontal)
                .accessibilityHidden(true)
        }
    }

    @ViewBuilder func createMoneyLabel() -> some View {
        if showMoneyLabel {
            Text(viewModel.moneyLabel())
                .foregroundStyle(viewModel.colorType())
                .accessibilityLabel("Money")
                .accessibilityHint("how much money owes")
        }
    }

    @ViewBuilder func createMoneyIcon() -> some View {
        if showMoneyLabel {
            Image(systemName: viewModel.iconType())
                .foregroundStyle(viewModel.colorType())
        }
    }
}

extension FriendCellNormal {
    class FriendCellNormalViewModel: ObservableObject {
        private let friend: FetchedResults<Friend>.Element
        private var moneyDebt: Float?

        public var friendName: String { friend.name ?? "Unkonwn" }
        public var hasPhoto: Bool { friend.photo != nil }

        init(friend: FetchedResults<Friend>.Element, moneyDebt: Float? = nil) {
            self.friend = friend
            self.moneyDebt = moneyDebt
        }

        func createImage() -> Image {
            #if canImport(UIKit)
                let uiImage = UIImage(data: friend.photo ?? Data()) ?? UIImage()
                return Image(uiImage: uiImage)
            #elseif canImport(AppKit)
                let image = NSImage(data: friend.photo ?? Data()) ?? NSImage()
                return Image(nsImage: image)
            #else
                return Image(systemName: "person.circle")
            #endif
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
                DesignSystem.DSColor.debtPositive
            case _ where friend.debt < 0:
                DesignSystem.DSColor.debtNegative
            default:
                DesignSystem.DSColor.debtNeutral
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
