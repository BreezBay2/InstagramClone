//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Taro Altrichter on 28.08.24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Divider()
            }
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .foregroundStyle(Color(.systemGray4))
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                HStack {
                    Text("Name")
                        .padding(.leading, 8)
                        .frame(width: 100, alignment: .leading)
                    
                    VStack {
                        TextField("Enter your name...", text: $viewModel.fullname)
                        
                        Divider()
                    }
                }
                .font(.subheadline)
                .frame(height: 36)
                
                HStack {
                    Text("Bio")
                        .padding(.leading, 8)
                        .frame(width: 100, alignment: .leading)
                    
                    VStack {
                        TextField("Enter your bio", text: $viewModel.bio)
                        
                        Divider()
                    }
                }
                .font(.subheadline)
                .frame(height: 36)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
