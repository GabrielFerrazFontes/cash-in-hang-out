//
//  FriendsDetailView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct FriendsDetailView: View {
    @EnvironmentObject var viewModel: FriendsDetailViewModel
    @State private var friendPhoto: Data?

    var body: some View {
        VStack {
            PhotoPicker(imageData: $friendPhoto)
                .padding(.horizontal, 100)
                .environmentObject(viewModel.createPhotoPickerViewModel())
            Text(viewModel.friendName)
            Text(viewModel.friendDebt)
                .foregroundStyle(viewModel.colorType())
        }
    }
}

#Preview {
    FriendsDetailView()
}
