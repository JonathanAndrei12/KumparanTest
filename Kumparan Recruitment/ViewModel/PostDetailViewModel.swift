//
//  PostDetailViewModel.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 13/08/22.
//

import Foundation

final class PostDetailViewModel: ObservableObject {
    @Published var post: Post = Post(userId: 0, id: 0, title: "", body: "") //Empty post
    @Published var user: User = User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")) //Empty User
    @Published var comments: [Comment] = []
    
    func getPostData(postId: Int) { //Get single post data from API
        let postURL = "https://jsonplaceholder.typicode.com/posts?id=\(postId)"
        if let url = URL(string: postURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let posts = try? decoder.decode([Post].self, from: data) { //Use array to catch the data. But because we catch using id, there still only one data captured
                        //Handling post data
                        DispatchQueue.main.async {
                            self?.post = posts[0]
                            self?.getUserData(userId: self!.post.userId)
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
    
    func getUserData(userId: Int) { //Get single user data from API
        let userURL = "https://jsonplaceholder.typicode.com/users?id=\(userId)"
        if let url = URL(string: userURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let users = try? decoder.decode([User].self, from: data) { //Use array to catch the data. But because we catch using id, there still only one data captured
                        //Handling user data
                        DispatchQueue.main.async {
                            self?.user = users[0]
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
    
    func fetchPostComments(postId: Int) {
        let commentsURL = "https://jsonplaceholder.typicode.com/comments?postId=\(postId)"
        if let url = URL(string: commentsURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //Handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let comments = try? decoder.decode([Comment].self, from: data) {
                        //Handling comments data
                        DispatchQueue.main.async {
                            self?.comments = comments
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
}
