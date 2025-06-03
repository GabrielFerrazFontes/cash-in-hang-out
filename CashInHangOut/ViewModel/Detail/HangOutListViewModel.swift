//
//  HangOutListViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 02/06/25.
//

import Foundation

extension HangOutsListView {
    class HangOutsListViewModel: ObservableObject {
        func createDetailViewModel(hangOut: HangOut) -> HangOutsDetailView.HangOutsDetailViewModel {
            .init(hangOut: hangOut)
        }

        func createCellViewModel(hangOut: HangOut) -> HangOutCellNormal.HangOutCellNormalViewModel {
            .init(hangOut: hangOut)
        }

        func removeHangOut(at offset: IndexSet) {
            
        }
    }
}
