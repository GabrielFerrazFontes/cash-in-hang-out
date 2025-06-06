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
            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(height: 50)
                .padding(.horizontal, 30)
            Text(text)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ButtonLayoutView(text: "Friends")
}
