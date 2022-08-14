//
//  PostCard.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 12/08/22.
//

import SwiftUI

struct PostCard: View {
    var user: User
    var post: Post
    
    var body: some View {
        NavigationLink(destination: PostDetailView(postId: post.id, userName: user.name)) {
            VStack(alignment: .leading) {
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
                
                Text("\(post.title)")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Text("\(post.body)")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .foregroundColor(Color.black)
                
                Divider()
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
}

//struct PostCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCard()
//    }
//}
