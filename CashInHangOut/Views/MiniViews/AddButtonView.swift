//
//  AddButtonView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI

struct AddButtonView: View {
    enum CreationType {
        case newFriend
        case newHangOut
    }
    
    @State var creationType: CreationType
    let viewModel: AddButtonViewModel
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: createDestinationView(for: creationType)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.red)
                        .frame(height: 50)
                        .padding(.horizontal, 30)
                    Text("New \(creationType == .newFriend ? "Friend" : "HangOut")")
                        .foregroundStyle(.white)
                }
            }
        }
    }
    
    @ViewBuilder func createDestinationView(for creationType: CreationType) -> some View {
        switch creationType {
        case .newFriend:
            viewModel.createNewFriend()
        case .newHangOut:
            viewModel.createNewHangOut()
        }
    }
}

extension AddButtonView {
    class AddButtonViewModel: ObservableObject {
        func createNewFriend() -> some View {
            let viewModel = CreateFriendView.CreateFriendViewModel()
            let photoPickerViewModel = PhotoPicker.PhotoPickerViewModel()
            return CreateFriendView(
                viewModel: viewModel,
                photoPickerViewModel: photoPickerViewModel
            )
        }
        
        func createNewHangOut() -> some View {
            return CreateHangView()
        }
    }
}

#Preview {
    let viewModel = AddButtonView.AddButtonViewModel()
    AddButtonView(creationType: .newFriend, viewModel: viewModel)
}
