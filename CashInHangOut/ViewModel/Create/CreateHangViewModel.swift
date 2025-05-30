//
//  CreateHangViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 30/05/25.
//

import CoreData

extension CreateHangView {
    class CreateHangViewModel: ObservableObject {
        let viewContext: NSManagedObjectContext
        
        init (viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }
        
        func createEqualPriceViewModel() -> CreateEqualPriceView.CreateEqualPriceViewModel {
            return .init(viewContext: viewContext)
        }
    }
}
