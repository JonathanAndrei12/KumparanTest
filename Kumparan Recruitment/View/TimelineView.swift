//
//  TimelineView.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 11/08/22.
//

import SwiftUI

struct TimelineView: View {
    
    @StateObject var timelineVM = TimelineViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack {
                    ForEach(timelineVM.posts, id: \.id) { post in
                        PostCard(user: timelineVM.getUserFromArr(userId: post.userId), post: post)
                    }
                }
            }
            .navigationTitle("Posts Feed")
            .onAppear(perform: {
                timelineVM.fetchUsers()
                timelineVM.fetchPosts()
            })
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
