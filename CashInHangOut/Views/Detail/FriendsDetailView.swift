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
                .padding(.horizontal, DesignSystem.DSSize.photoPicker)
                .environmentObject(viewModel.createPhotoPickerViewModel())
                .padding(.top)
                .accessibilityLabel("Photo of a friend")
                .accessibilityHint("Change the photo of your friend")
                .onChange(of: friendPhoto) {
                    viewModel.updatePhoto(friendPhoto)
                }
            Text(viewModel.friendName)
                .accessibilityLabel("Name")
                .accessibilityHint("Name of a friend")
            Text(viewModel.friendDebt)
                .accessibilityLabel("Debt")
                .accessibilityHint("Debt of a friend")
                .foregroundStyle(viewModel.colorType())
            NavigationStack {
                List {
                    ForEach(viewModel.hangOutList, id: \.self) { hangOut in
                        NavigationLink {
                            HangOutsDetailView()
                                .environmentObject(viewModel.createHangOutDetailViewModel(hangOut))
                        } label: {
                            HangOutCellNormal()
                                .environmentObject(viewModel.createHangOutViewModel(hangOut))
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    let viewContext = PersistenceController.preview.container.viewContext
    let viewModel = FriendsDetailView.FriendsDetailViewModel(friend: .example, viewContext: viewContext)
    FriendsDetailView()
        .environmentObject(viewModel)
}
