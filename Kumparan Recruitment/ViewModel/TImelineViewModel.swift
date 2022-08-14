//
//  TImelineViewModel.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 11/08/22.
//

import Foundation

final class TimelineViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var users: [User] = []
//    @Published var isLoading: Bool = false

    func fetchPosts() { //Fetch all posts data from API
        let postsURL = "https://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: postsURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let posts = try? decoder.decode([Post].self, from: data) {
                        //Handling posts data
                        DispatchQueue.main.async {
                            self?.posts = posts
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
    
    func fetchUsers() { //Fetch all users data from API
        let usersURL = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: usersURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let users = try? decoder.decode([User].self, from: data) {
                        //Handling posts data
                        DispatchQueue.main.async {
                            self?.users = users
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
    
    func getUserFromArr(userId: Int) -> User { //Get single user from array for author in posts
        for u in self.users {
            if u.id == userId {
                return u
            }
        }
        return User.init(id: 0, name: "", username: "", email: "", address: Address.init(street: "", suite: "", city: "", zipcode: "", geo: Geo.init(lat: "", lng: "")), phone: "", website: "", company: Company.init(name: "", catchPhrase: "", bs: ""))
    }
}
