//
//  DesignSystem.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 06/06/25.
//

import SwiftUI

struct DesignSystem {
    enum DSColor {
        static let primary = Color.blue
        static let secundary = Color.white

        static let debtPositive = Color.red
        static let debtNegative = Color.green
        static let debtNeutral = Color.black
    }

    enum DSSize {
        static let photoPicker: CGFloat = 100
        static let photoSize: CGFloat = 40

        static let buttonHeight: CGFloat = 50
        static let buttonPadding: CGFloat = 30
        static let buttonCornerRadius: CGFloat = 25
    }
}
