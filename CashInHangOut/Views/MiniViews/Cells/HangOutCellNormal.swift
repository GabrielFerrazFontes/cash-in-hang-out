//
//  HangOutCellNormal.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 03/06/25.
//

import SwiftUI

struct HangOutCellNormal: View {
    @EnvironmentObject var viewModel: HangOutCellNormalViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.hangOutDate)
            Text(viewModel.hangOutValue)
        }
    }
}

extension HangOutCellNormal {
    class HangOutCellNormalViewModel: ObservableObject {
        private let hangOut: HangOut
        
        public var hangOutDate: String {
            hangOut.date?.formatted() ?? "N/A"
        }
        
        public var hangOutValue: String {
            hangOut.valueToString()
        }
        
        init(hangOut: HangOut) {
            self.hangOut = hangOut
        }
    }
}
