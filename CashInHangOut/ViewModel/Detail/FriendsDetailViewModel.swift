//
//  FriendsDetailViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

extension FriendsDetailView {
    class FriendsDetailViewModel: ObservableObject {
        private let friend: Friend

        public var friendPhoto: Data? { friend.photo }
        public var friendName: String { friend.name ?? "Unknown" }
        public var friendDebt: String { friend.valueToString() }

        init(friend: Friend) {
            self.friend = friend
        }

        func createPhotoPickerViewModel() -> PhotoPicker.PhotoPickerViewModel {
            PhotoPicker.PhotoPickerViewModel(imageData: friend.photo)
        }

        func colorType() -> Color {
            let value = friend.debt
            switch value {
            case _ where value > 0:
                return .red
            case _ where value < 0:
                return .green
            default:
                return .black
            }
        }
    }
}
