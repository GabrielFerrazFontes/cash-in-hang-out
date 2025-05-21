//
//  FriendsDetailView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct FriendsDetailView: View {
    let friend: Friend
    
    @EnvironmentObject var viewModel: FriendsDetailViewModel
    @State private var friendPhoto: Data?
    
    var body: some View {
        VStack {
            PhotoPicker(imageData: $friendPhoto)
                .padding(.horizontal, 100)
                .environmentObject(viewModel.createPhotoPickerViewModel(imageData: friend.photo))
            Text(friend.name ?? "Unknown")
            Text("\(friend.debt, format: .currency(code: "BRL"))")
                .foregroundStyle(viewModel.colorType(value: friend.debt))
        }
    }
}

#Preview {
    let friend: Friend = Friend.example
    FriendsDetailView(friend: friend)
}
