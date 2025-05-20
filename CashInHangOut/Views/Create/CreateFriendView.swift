//
//  CreateFriendView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateFriendView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    
    let viewModel: CreateFriendViewModel
    let photoPickerViewModel: PhotoPicker.PhotoPickerViewModel
    
    var body: some View {
        Form {
            PhotoPicker(viewModel: photoPickerViewModel)
                .padding(.horizontal, 100)
            TextField("Enter Friend Name", text: viewModel.$name)
            Button("Create New Friend") {
                viewModel.addFriend(photo: photoPickerViewModel.imageData)
                dismiss()
            }
        }
        Spacer()
    }
}

#Preview {
    let viewModel = CreateFriendView.CreateFriendViewModel()
    let photoPickerViewModel = PhotoPicker.PhotoPickerViewModel()
    CreateFriendView(
        viewModel: viewModel,
        photoPickerViewModel: photoPickerViewModel
    )
}
