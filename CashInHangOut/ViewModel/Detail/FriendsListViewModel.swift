//
//  FriendsListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI
import CoreData

extension FriendsListView {
    class FriendsListViewModel: ObservableObject {
        let viewContext: NSManagedObjectContext
        
        init(viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }
        
        func createAddButtonAction() -> AddButtonView.AddButtonViewModel {
            return .init(viewContext: viewContext)
        }
        
        func createCellViewModel() -> FriendCellNormal.FriendCellNormalViewModel {
            return .init()
        }
        
        func createDetailViewModel() -> FriendsDetailView.FriendsDetailViewModel {
            return .init()
        }
    }
}
