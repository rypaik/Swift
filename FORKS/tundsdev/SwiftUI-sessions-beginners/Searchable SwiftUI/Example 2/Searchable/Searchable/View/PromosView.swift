//
//  PromosView.swift
//  PromosView
//
//  Created by Tunde on 29/07/2021.
//

import SwiftUI

struct PromosView: View {
        
    @Environment(\.dismissSearch) var dismissSearch
    @ObservedObject var vm: MenuViewModel
    @Binding var query: String
    
    var body: some View {
        List {
            Group {

                Button("Clear Search") {
                    dismissSearch()
                    handleReset()
                }
                    
                Text("Check out our latest promos")
                    .font(.largeTitle)

                ForEach(vm.promos) { item in
                    
                    PromoItemView(item: item)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

        }
        .listStyle(.grouped)
    }
    
    private func handleReset() {
        query = ""
        vm.search()
    }
}

struct PromosView_Previews: PreviewProvider {
    static var previews: some View {
        PromosView(vm: MenuViewModel(),
                   query: .constant("Heyyy"))
    }
}
