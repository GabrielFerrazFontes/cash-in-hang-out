//
//  CreateHangView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateHangView: View {
    @EnvironmentObject var viewModel: CreateHangViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                NavigationLink {
                    CreateEqualPriceView()
                        .environmentObject(viewModel.createEqualPriceViewModel())
                } label: {
                    ButtonLayoutView(text: "Dividir Igual")
                }
                Spacer()
                NavigationLink(destination: CreateDifferentPriceView()) {
                    ButtonLayoutView(text: "Dividir Separado")
                }
                .disabled(true)
                Spacer()
                NavigationLink(destination: CreatePizzaPriceView()) {
                    ButtonLayoutView(text: "Dividir Pizza")
                }
                .disabled(true)
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    CreateHangView()
}
