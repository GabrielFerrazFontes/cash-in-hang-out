//
//  CreateFriendView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI
import CoreData

struct CreateFriendView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var selectedImageData: Data?
    
    @EnvironmentObject var viewModel: CreateFriendViewModel
    
    var body: some View {
        Form {
            PhotoPicker(imageData: $selectedImageData)
                .padding(.horizontal, DesignSystem.DSSize.photoPicker)
                .environmentObject(viewModel.createPhotoPickerViewModel(imageData: selectedImageData))
                .accessibilityLabel("Photo of a friend")
                .accessibilityHint("Add a photo of your friend")
            TextField("Enter Friend Name", text: $name)
                .accessibilityLabel("Enter name of friend")
                .accessibilityHint("This name will be used to identify your friend")
            Button {
                viewModel.addFriend(name: name, photo: selectedImageData)
                dismiss()
            } label : {
                ButtonLayoutView(text: "Create New Friend")
            }
            .accessibilityLabel("Create")
            .accessibilityHint("Create a new friend")
        }
        Spacer()
    }
}

#Preview {
    CreateFriendView()
}
