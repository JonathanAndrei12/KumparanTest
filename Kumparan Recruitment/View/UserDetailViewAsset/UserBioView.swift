//
//  UserBioView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import SwiftUI

struct UserBioView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Contacts")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(alignment: .top) {
                    Text("Email")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.email)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top) {
                    Text("Phone")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.phone)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            
            Divider()
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Address")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(alignment: .top) {
                    Text("Street")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.address.street)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top) {
                    Text("Suites")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.address.suite)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top) {
                    Text("City")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.address.city)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top) {
                    Text("Zipcode")
                        .font(.subheadline)
                        .frame(width: 70, alignment: .leading)
                    Text(":")
                        .font(.subheadline)
                    Text("\(user.address.zipcode)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
}

//struct UserBioView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserBioView()
//    }
//}
