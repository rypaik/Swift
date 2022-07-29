//
//  UserModel.swift
//  MVVM_JSON_API_00
//
//  Created by Jeen Byun on 7/13/22.
//

import Foundation

// UserModel.swift
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
