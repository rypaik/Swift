//
//  StudyCard.swift
//  StudyCardsFbMVVM
//
//  Created by Jeen Byun on 7/5/22.
//

import Foundation
import FirebaseFirestoreSwift

struct StudyCard : Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var question: String
    var answer: String
    var passed: Bool = false
}
