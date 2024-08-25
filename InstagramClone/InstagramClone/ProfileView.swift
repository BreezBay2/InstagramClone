//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 16.08.24.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    
                    // picture + numbers
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .foregroundStyle(Color(.systemGray4))
                        
                        Spacer()
                        
                        HStack {
                            VStack {
                                Text("5")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("Posts")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            VStack {
                                Text("12")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("Followers")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            VStack {
                                Text("50")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("Following")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                        }
                    }
                    .padding(.horizontal)
                    
                    // name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Peter Parker")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("This is a test bio for now...")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Follow or Edit Profile Button
                    Button {
                        print("Follow")
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .background(Color(.systemBlue))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                    }
                    
                    Divider()
                    
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        ForEach(0...4, id: \.self) { post in
                            Image("picture1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageDimension, height: imageDimension)
                                .clipped()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Log out")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
