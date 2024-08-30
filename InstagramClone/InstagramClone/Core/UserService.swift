//
//  UserService.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 26.08.24.
//

import Foundation
import Firebase

struct UserService {
    @MainActor
    static func fetchAllUsers() async throws -> [User] {  
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
