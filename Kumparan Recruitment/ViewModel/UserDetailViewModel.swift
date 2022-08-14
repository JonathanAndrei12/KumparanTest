//
//  UserDetailViewModel.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import Foundation

final class UserDetailViewModel: ObservableObject {
    @Published var user: User = User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")) //Empty User
    @Published var albums: [Album] = []
    @Published var photos: [Photo] = []
    
    func getUserData(userId: Int) { //Get single user data from API
        let userURL = "https://jsonplaceholder.typicode.com/users?id=\(userId)"
        if let url = URL(string: userURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //Handle error
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
    
    func fetchUserAlbums(userId: Int) {
        let albumsURL = "https://jsonplaceholder.typicode.com/albums?userId=\(userId)"
        if let url = URL(string: albumsURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //Handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let albums = try? decoder.decode([Album].self, from: data) {
                        //Handling post data
                        DispatchQueue.main.async {
                            self?.albums = albums
                        }
                    } else {
                        //Handling data error
                        print(error as Any)
                    }
                }
            }.resume()
        }
    }
    
    func fetchUserPhotos() {
        let photosURL = "https://jsonplaceholder.typicode.com/photos"
        if let url = URL(string: photosURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
                if let error = error {
                    //Handle error
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //Handle prop from ex. first_name to firstName
                    
                    if let data = data,
                       let photos = try? decoder.decode([Photo].self, from: data) {
                        //Handling post data
                        DispatchQueue.main.async {
                            self?.photos = photos
//                            print(photos)
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
