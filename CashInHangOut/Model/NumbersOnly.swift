//
//  NumbersOnly.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 21/05/25.
//

import Combine

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            if value != filtered {
                value = filtered
            }
        }
    }
}
