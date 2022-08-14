//
//  PhotoDetailView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import SwiftUI

struct PhotoDetailView: View {
    var user: User
    var photo: Photo
    
    @State var currentScale: CGFloat = 0
    @State var finalScale: CGFloat = 1
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: photo.url)!, placeholder: {ProgressView()}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                })
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .addPinchZoom()
                
                HStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 30, height: 30)
                        .padding(.all, 0)
                    VStack(alignment: .leading) {
                        Text("\(user.name)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(user.company.name) | \(user.company.catchPhrase)")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                Text("\(photo.title)")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            }
        }
        .navigationTitle("\(user.name)'s Photo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(user: User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")), photo: Photo(albumId: 0, id: 0, title: "", url: "", thumbnailUrl: ""))
    }
}
