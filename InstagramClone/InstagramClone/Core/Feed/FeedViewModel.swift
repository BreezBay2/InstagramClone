//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 30.08.24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
