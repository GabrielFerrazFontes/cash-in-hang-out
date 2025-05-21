//
//  FriendsDetailViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

extension FriendsDetailView {
    class FriendsDetailViewModel: ObservableObject {
        func createPhotoPickerViewModel(imageData: Data?) -> PhotoPicker.PhotoPickerViewModel {
            PhotoPicker.PhotoPickerViewModel(imageData: imageData)
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
