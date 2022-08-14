//
//  UserDetailViewModel.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import Foundation

final class UserDetailViewModel: ObservableObject {
    @Published var user: User = User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")) //Empty User
    
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
}
