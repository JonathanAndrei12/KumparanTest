//
//  UserAlbumsGalleryView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import SwiftUI

struct UserAlbumsGalleryView: View {
    
    var albums: [Album]
    var photos: [Photo]
    var user: User
    
    var body: some View {
        VStack {
            ForEach(albums, id: \.id) { album in
                Text("\(album.title)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)

                LazyVGrid(columns: [
                    GridItem(.fixed(120)),
                    GridItem(.fixed(120)),
                    GridItem(.fixed(120))
                ], spacing: 2, content: {
                    ForEach(photos.filter { $0.albumId == album.id }, id: \.id) { photo in
                        NavigationLink(destination: PhotoDetailView(user: user, photo: photo)) {
                            AsyncImage(url: URL(string: photo.thumbnailUrl)!, placeholder: {ProgressView()}, image: { image in
                                Image(uiImage: image)
                                    .resizable()
                            })
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 125, height: 125)
                        }
                    }
                })
                
                Divider()
            }
        }
    }
}

//struct UserAlbumsGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserAlbumsGalleryView()
//    }
//}
