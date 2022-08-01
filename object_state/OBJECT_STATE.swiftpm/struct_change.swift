//
//  File.swift
//  OBJECT_STATE
//
//  Created by Jeen Byun on 6/24/22.
//

import Foundation


struct LazyUser {
    var name: String
    // use lazy to make mutable datat in Struct
    lazy var reversedName: String = {
        String(name.reversed())
    }()
}
