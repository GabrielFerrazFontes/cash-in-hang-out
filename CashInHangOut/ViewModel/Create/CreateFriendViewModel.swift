//
//  CreateFriendViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI
import CoreData

extension CreateFriendView {
    class CreateFriendViewModel: ObservableObject {
        
        let viewContext: NSManagedObjectContext
        
        init (viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }
        
        func addFriend(name: String, photo: Data?) {
            let newFriend = Friend(context: viewContext)
            newFriend.name = name
            newFriend.debt = 0
            newFriend.photo = photo
            do {
                try viewContext.save()
            } catch {
                // Cant create a new friend (Show a popup)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        
        func createPhotoPickerViewModel(imageData: Data?) -> PhotoPicker.PhotoPickerViewModel {
            PhotoPicker.PhotoPickerViewModel(imageData: imageData)
        }
    }
}
