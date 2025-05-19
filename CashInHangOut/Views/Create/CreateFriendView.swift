//
//  CreateFriendView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateFriendView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Friend.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Friend>
    
    let photoPickerViewModel: PhotoPicker.PhotoPickerViewModel
    
    var body: some View {
        PhotoPicker(viewModel: photoPickerViewModel)
        

    }
    
    private func addFriend() {
        let newFriend = Friend(context: viewContext)
        
        do {
            try viewContext.save()
        } catch {
            // Cant create a new friend (Show a popup)
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    let photoPickerViewModel = PhotoPicker.PhotoPickerViewModel()
    CreateFriendView(photoPickerViewModel: photoPickerViewModel)
}
