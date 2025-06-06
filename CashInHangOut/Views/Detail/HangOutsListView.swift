//
//  HangOutsListView.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI

struct HangOutsListView: View {
    @EnvironmentObject var viewModel: HangOutsListViewModel

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \HangOut.date, ascending: true)],
        animation: .default)
    private var hangOuts: FetchedResults<HangOut>

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Hang Out List")) {
                    ForEach(hangOuts) { hangOut in
                        NavigationLink {
                            HangOutsDetailView()
                                .environmentObject(viewModel.createDetailViewModel(hangOut: hangOut))
                        } label: {
                            HangOutCellNormal()
                                .environmentObject(viewModel.createCellViewModel(hangOut: hangOut))
                        }
                    }
                    .onDelete(perform: viewModel.removeHangOut)
                }
                .headerProminence(.increased)
            }
            .listStyle(GroupedListStyle())
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    HangOutsListView()
}
