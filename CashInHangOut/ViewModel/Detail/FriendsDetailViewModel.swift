//
//  FriendsDetailViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 20/05/25.
//

import SwiftUI
import CoreData

extension FriendsDetailView {
    class FriendsDetailViewModel: ObservableObject {
        private let viewContext: NSManagedObjectContext
        private let friend: Friend

        public var friendPhoto: Data? { friend.photo }
        public var friendName: String { friend.name ?? "Unknown" }
        public var friendDebt: String { friend.valueToString() }
        public var hangOutList: [HangOut] { friend.hangOutsList() }

        init(friend: Friend, viewContext: NSManagedObjectContext) {
            self.friend = friend
            self.viewContext = viewContext
        }

        func createPhotoPickerViewModel() -> PhotoPicker.PhotoPickerViewModel {
            .init(imageData: friend.photo)
        }

        func createHangOutViewModel(_ hangOut: HangOut) -> HangOutCellNormal.HangOutCellNormalViewModel {
            .init(hangOut: hangOut)
        }

        func createHangOutDetailViewModel(_ hangOut: HangOut) -> HangOutsDetailView.HangOutsDetailViewModel {
            .init(hangOut: hangOut, viewContext: viewContext)
        }

        func updatePhoto(_ data: Data?) {
            friend.photo = data
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }

        func colorType() -> Color {
            let value = friend.debt
            switch value {
            case _ where value > 0:
                return .red
            case _ where value < 0:
                return .green
            default:
                return .black
            }
        }
    }
}
