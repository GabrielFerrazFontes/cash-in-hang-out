//
//  ButtonLayoutView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 06/06/25.
//

import SwiftUI

struct ButtonLayoutView: View {
    let text: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DesignSystem.DSSize.buttonCornerRadius)
                .fill(DesignSystem.DSColor.primary)
                .frame(height: DesignSystem.DSSize.buttonHeight)
                .padding(.horizontal, DesignSystem.DSSize.buttonPadding)
            Text(text)
                .foregroundStyle(DesignSystem.DSColor.secundary)
        }
    }
}

#Preview {
    ButtonLayoutView(text: "Friends")
}
