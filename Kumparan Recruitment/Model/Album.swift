//
//  Album.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

/* JSON Data
 {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
 },
 */

import Foundation

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}
