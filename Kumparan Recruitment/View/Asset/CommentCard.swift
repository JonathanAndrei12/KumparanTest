//
//  CommentCard.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 13/08/22.
//

import SwiftUI

struct CommentCard: View {
    var comment: Comment
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 30, height: 30)
                    .padding(.all, 0)
                
                VStack(alignment:.leading) {
                    Text("\(comment.name)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text("\(comment.body)")
                        .font(.caption2)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                .frame(width: UIScreen.main.bounds.width - 70, alignment: .leading)
                .background(Color("BubbleColor"))
                .cornerRadius(10)
            }
            
            Spacer(minLength: 20)
        }
    }
}

//struct CommentCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCard()
//    }
//}
