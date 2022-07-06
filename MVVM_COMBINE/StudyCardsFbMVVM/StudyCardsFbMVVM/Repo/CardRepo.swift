//
//  CardRepo.swift
//  StudyCardsFbMVVM
//
//  Created by Jeen Byun on 7/5/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import UIKit

final class CardRepository: ObservableObject {
    private let path = "studyCards"
    private let store = Firestore.firestore()
    @Published var studyCards: [StudyCard] = []
    
    init() {
        get()
    }

    //https://youtu.be/gSOqyuPDKqo?t=1128
    func get() {
        store.collection(path).addSnapshotListener{(snapshot, error) in
            if let error = error {
                print(error)
                return
                }
            self.studyCards = snapshot?.documents.compactMap {
                try? $0.data(as: StudyCard.self)
            } ?? []
        }
    }
    
    func add(_ studyCard: StudyCard) {
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("Failed Adding a Study Card")
        }
    }

    func remove(_ studyCard: StudyCard){
        guard let documentId = studyCard.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Error Removing Card: \(error)")
            }
        }
    }
    
    func update(_ studyCard: StudyCard){
        guard let documentId = studyCard.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from:studyCard)
        } catch {
            fatalError("Error Adding a study card")
        }
    }

}
