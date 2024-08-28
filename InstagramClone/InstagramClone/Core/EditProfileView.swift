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
    @State private var text = ""
    
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
                        
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Divider()
            }
            
            VStack {
                Image("picture1")
                    .resizable()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Divider()
            }
            .padding(.vertical, 8)
            
            VStack {
                HStack {
                    Text("Name")
                        .padding(.leading, 8)
                        .frame(width: 100, alignment: .leading)
                    
                    VStack {
                        TextField("Enter your name...", text: $text)
                        
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
                        TextField("Enter your bio", text: $text)
                        
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
    EditProfileView()
}
