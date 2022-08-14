//
//  UserDetailView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import SwiftUI

struct UserDetailView: View {
    
    var userId: Int
    var userName: String
    
    @StateObject var userDetailVM = UserDetailViewModel()
    @State var screen: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 60, height: 60)
                        .padding(.all, 0)
                    
                    Text("\(userDetailVM.user.name)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)

                    Text("\(userDetailVM.user.company.name)")
                        .foregroundColor(.gray)
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Text("\"\(userDetailVM.user.company.catchPhrase)\"")
                        .foregroundColor(.gray)
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                .padding(.top)
                
                UserDetailTabBar(screen: $screen)
                
                if screen == 0 {
                    UserAlbumsGalleryView(albums: userDetailVM.albums, photos: userDetailVM.photos, user: userDetailVM.user)
                } else if screen == 1 {
                    UserBioView(user: userDetailVM.user)
                }
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
        }
        .navigationTitle("\(userName)'s Profile")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            userDetailVM.getUserData(userId: userId)
            userDetailVM.fetchUserAlbums(userId: userId)
            userDetailVM.fetchUserPhotos()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userId: 1, userName: "Leanne")
    }
}
