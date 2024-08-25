//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 17.08.24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // username + image
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
            .padding(.leading, 8)
            
            // post
            Image("picture1")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)
            
            // likes
            Text("16 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // post caption
            HStack {
                Text("username")
                    .fontWeight(.semibold)
                Text("This is a picture of my dog")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // time label
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell()
}
