//
//  SearchView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 16.08.24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(User.MOCK_USERS) { user in
                        HStack {
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
                            
                            VStack(alignment: .leading) {
                                Text(user.username)
                                    .fontWeight(.semibold)
                                
                                if let fullname = user.fullname {
                                    Text(fullname)
                                }
                            }
                            .font(.footnote)
                            
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                    }
                }
                .padding(.top)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
