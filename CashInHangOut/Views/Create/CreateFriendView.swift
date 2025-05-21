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
                .padding(.horizontal, 100)
                .environmentObject(viewModel.createPhotoPickerViewModel(imageData: selectedImageData))
            TextField("Enter Friend Name", text: $name)
            Button("Create New Friend") {
                viewModel.addFriend(name: name, photo: selectedImageData)
                dismiss()
            }
        }
        Spacer()
    }
}

#Preview {
    CreateFriendView()
}
