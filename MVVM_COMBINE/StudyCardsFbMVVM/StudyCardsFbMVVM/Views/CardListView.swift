//
//  CardListView.swift
//  StudyCardsFbMVVM
//
//  Created by Jeen Byun on 7/5/22.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject var cardListViewModel: CardListViewModel
    @State private var showingForm = false
    @State private var showPassed = false
    
    var body: some View {
// NavigationView already declared in Top Level @main 
        //        NavigationView {
        
            VStack {
                Toggle(isOn: $showPassed) { Text("\(showPassed ? "Hide" : "Show") passed questions") }
                List {
                    ForEach(cardListViewModel.cardViewModels.filter { $0.studyCard.passed == showPassed }) { cardVM in CardView(cardViewModel: cardVM)
                            .onLongPressGesture(minimumDuration: 1.5) {
                                var studyCard = cardVM.studyCard
                                studyCard.passed.toggle()
                                cardListViewModel.update(studyCard)
                            }
                    }.onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
                .navigationTitle("StudyCards")
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.white))
                }.sheet(isPresented: $showingForm) {
                    FormView{ (studyCard) in
                        cardListViewModel.add(studyCard)
                        showingForm = false
                    }
                }
            }
        }
//    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { cardListViewModel.cardViewModels[$0].studyCard}.forEach(cardListViewModel.remove) }
}


