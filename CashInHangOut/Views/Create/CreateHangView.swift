//
//  CreateHangView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct CreateHangView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink {
                    CreateEqualPriceView()
                        .environmentObject(CreateEqualPriceView.CreateEqualPriceViewModel())
                } label: {
                    Text("Dividir Igual")
                }
                Spacer()
                NavigationLink(destination: CreateDifferentPriceView()) {
                    Text("Dividir Separado")
                }
                Spacer()
                NavigationLink(destination: CreatePizzaPriceView()) {
                    Text("Dividir Pizza")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CreateHangView()
}
