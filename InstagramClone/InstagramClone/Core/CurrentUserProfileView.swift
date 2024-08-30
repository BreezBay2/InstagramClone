//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 16.08.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfileView = false
    
    let user: User

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    
                    // picture + numbers
                    HStack {
                        let imageUrl = URL(string: user.profileImageUrl ?? "")
                        
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray2))
                        }
                        
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
                        Text(user.fullname ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text(user.bio ?? "")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Follow or Edit Profile Button
                    Button {
                        showEditProfileView.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .background(.white)
                            .foregroundStyle(.black)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                    
                    Divider()
                    
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        ForEach(posts) { post in
                            Image(post.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageDimension, height: imageDimension)
                                .clipped()
                        }
                    }
                }
                .fullScreenCover(isPresented: $showEditProfileView, content: {
                    EditProfileView(user: user)
                })
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
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
    CurrentUserProfileView(user: User.MOCK_USERS[2])
}
