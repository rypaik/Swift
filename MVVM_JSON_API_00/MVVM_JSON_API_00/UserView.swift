//
//  UserView.swift
//  MVVM_JSON_API_00
//
//  Created by Jeen Byun on 7/13/22.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading){
            Text("**Name**: \(user.name)")
            Text("**Email**: \(user.email)")
            Divider()
            Text("**Company**: \(user.company.name)")
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(user: .init(id: 0,
//                             name: "Matthew",
//                             email: "Mslushie@gmail.com",
//                             company: .init(name:"Slushie Inc")))
//    }
//}
