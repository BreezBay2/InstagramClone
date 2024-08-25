//
//  User.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 25.08.24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "spider-man", profileImageUrl: "spider-man1", fullname: "Peter Parker", bio: "Your friendly neighborhood super hero", email: "spiderman@email.com"),
        .init(id: NSUUID().uuidString, username: "goku", profileImageUrl: "spider-man1", fullname: "Son Goku", bio: "Your friendly neighborhood super hero", email: "spiderman@email.com"),
        .init(id: NSUUID().uuidString, username: "bundeskanzler", profileImageUrl: "spider-man1", fullname: "Olaf Scholz", bio: "Your friendly neighborhood super hero", email: "spiderman@email.com"),
        .init(id: NSUUID().uuidString, username: "kingjames", profileImageUrl: "spider-man1", fullname: "Lebron James", bio: "Your friendly neighborhood super hero", email: "spiderman@email.com"),
        .init(id: NSUUID().uuidString, username: "sponge", profileImageUrl: "spider-man1", fullname: "Spongebob Squarepants", bio: "Your friendly neighborhood super hero", email: "spiderman@email.com"),
    ]
}
