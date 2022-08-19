//
//  ProfilePhotoView.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 17.08.2022.
//

import SwiftUI

struct ProfilePhotoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?   // UIkit
    @State private var profileImage: Image?      // SwiftUI
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Select a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if profileImage != nil {
                Button {
                    print("DEBUG: Finish registering user..")
                } label: {
                    Text("Continue..")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
            
            // Dissmiss screen (for registrationView)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Dissmiss screen (for registrationView)")
                        .font(.footnote)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

// custom modifier
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView()
    }
}
