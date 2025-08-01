//
//  AddButtonView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI
import CoreData

struct AddButtonView: View {
    enum CreationType {
        case newFriend
        case newHangOut
    }

    @State var creationType: CreationType
    @EnvironmentObject var viewModel: AddButtonViewModel

    var body: some View {
        NavigationView {
            NavigationLink(destination: createDestinationView(for: creationType)) {
                ButtonLayoutView(text: "New \(creationType == .newFriend ? "Friend" : "HangOut")")
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
        let viewContext: NSManagedObjectContext

        init(viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }

        func createNewFriend() -> some View {
            let viewModel = CreateFriendView.CreateFriendViewModel(viewContext: viewContext)
            return CreateFriendView()
                .environmentObject(viewModel)
        }

        func createNewHangOut() -> some View {
            return CreateHangView()
        }
    }
}

#Preview {
    AddButtonView(creationType: .newFriend)
}
