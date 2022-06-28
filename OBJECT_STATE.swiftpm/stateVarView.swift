//
//  File.swift
//  OBJECT_STATE
//
//  Created by Jeen Byun on 6/24/22.
//

import SwiftUI

struct stateVarView: View {
    @State var reloadCount = 0
    
    var body: some View {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.reloadCount += 1
        }
        return Text("Reloads:\(reloadCount)")
    }
}


