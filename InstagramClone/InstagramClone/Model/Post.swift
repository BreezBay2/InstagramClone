//
//  Post.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 25.08.24.
//

import Foundation

struct Post: Identifiable, Codable {
    
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test caption", likes: 13, imageUrl: "picture1", timeStamp: Date(), user: User.MOCK_USERS[0])
    ]
}
