//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 16.08.24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            UploadPostView()
                .tabItem {
                    Image(systemName: "plus")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            ProfileView(user: User.MOCK_USERS[0])
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
