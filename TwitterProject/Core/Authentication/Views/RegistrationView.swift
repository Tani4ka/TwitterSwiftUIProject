//
//  RegistrationView.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 15.08.2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Get started", title2: "Create your account")
            Spacer()
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placehlderText: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placehlderText: "Username",
                                 text: $username)
                
                CustomInputField(imageName: "envelope",
                                 placehlderText: "Fullname",
                                 text: $fullname)
                
                CustomInputField(imageName: "lock",
                                 placehlderText: "Passwoord",
                                 text: $password)
            }
            .padding(32)
            
            Button {
                print("Sign up here..")
            } label: {
                Text("Sign Up..")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)

        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
