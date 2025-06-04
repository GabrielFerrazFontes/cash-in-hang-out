//
//  HangOutListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 02/06/25.
//

import CoreData

extension HangOutsListView {
    class HangOutsListViewModel: ObservableObject {
        private let viewContext: NSManagedObjectContext
        private var hangOuts: [HangOut] = []

        init (viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
            updateHangOutsList()
        }

        func createDetailViewModel(hangOut: HangOut) -> HangOutsDetailView.HangOutsDetailViewModel {
            .init(hangOut: hangOut, viewContext: viewContext)
        }

        func createCellViewModel(hangOut: HangOut) -> HangOutCellNormal.HangOutCellNormalViewModel {
            .init(hangOut: hangOut)
        }

        func updateHangOutsList() {
            let fetchRequest: NSFetchRequest<HangOut> = HangOut.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \HangOut.date, ascending: true)]
            hangOuts = (try? viewContext.fetch(fetchRequest)) ?? []
        }

        func removeHangOut(at offset: IndexSet) {
            for index in offset {
                let hangOutToDelete = hangOuts[index]
                viewContext.delete(hangOutToDelete)
            }
            do {
                try viewContext.save()
                updateHangOutsList()
            } catch {
                // present popup
                print("error at deleting friend: \(error)")
            }
        }
    }
}
