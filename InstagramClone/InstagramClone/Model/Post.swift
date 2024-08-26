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
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test caption for a picture of a dog", likes: 13, imageUrl: "picture1", timeStamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Bird", likes: 13, imageUrl: "picture2", timeStamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "I like beer and hanging out with my friends", likes: 13, imageUrl: "picture3", timeStamp: Date(), user: User.MOCK_USERS[2]),
    ]
}
