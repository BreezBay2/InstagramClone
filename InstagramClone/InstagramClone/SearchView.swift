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
                    ForEach(0 ... 12, id: \.self) { user in
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
                            
                            Text("username")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
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
