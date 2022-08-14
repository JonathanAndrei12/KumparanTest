//
//  PostDetailView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 13/08/22.
//

import SwiftUI

struct PostDetailView: View {
    
    var postId: Int
    var userName: String
    
    @StateObject var postDetailVM = PostDetailViewModel()
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 30, height: 30)
                        .padding(.all, 0)
                    VStack(alignment: .leading) {
                        Text("\(postDetailVM.user.name)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)

                        Text("\(postDetailVM.user.company.name) | \(postDetailVM.user.company.catchPhrase)")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                    }
                }

                Text("\(postDetailVM.post.title)")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)

                Spacer()

                Text("\(postDetailVM.post.body)")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .truncationMode(.tail)

                Divider()
                
                HStack {
                    Text("Comments")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("\(postDetailVM.comments.count)")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                
                ForEach(postDetailVM.comments, id: \.id) { comment in
                    
                    CommentCard(comment: comment)
                    
                }
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
        .navigationTitle("\(userName)'s Post")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            postDetailVM.getPostData(postId: postId)
            postDetailVM.fetchPostComments(postId: postId)
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(postId: 1, userName: "Test")
    }
}
