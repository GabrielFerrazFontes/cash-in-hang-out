//
//  CreateFriendViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

extension CreateFriendView {
    class CreateFriendViewModel: ObservableObject {
        
        @State var name: String = ""
        
        // Core Data
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Friend.name, ascending: true)],
            animation: .default)
        private var friends: FetchedResults<Friend>
        
        func addFriend(photo: Data?) {
            let newFriend = Friend(context: viewContext)
            newFriend.name = name
            newFriend.debt = 0
            newFriend.photo = photo
            
            do {
                try viewContext.save()
                print("New Friend Created")
            } catch {
                // Cant create a new friend (Show a popup)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
