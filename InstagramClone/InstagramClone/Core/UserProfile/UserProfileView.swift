//
//  UserProfileView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 27.08.24.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User
    
    @StateObject var viewModel: UserProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserProfileViewModel(user: user))
        self.user = user
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        ScrollView {
            HStack {
                let imageUrl = URL(string: user.profileImageUrl ?? "")
                
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
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
            
            // Follow Button
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
                ForEach(viewModel.posts) { post in
                    AsyncImage(url: URL(string: post.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                    } placeholder: {
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
    }
}

#Preview {
    UserProfileView(user: User.MOCK_USERS[0])
}
