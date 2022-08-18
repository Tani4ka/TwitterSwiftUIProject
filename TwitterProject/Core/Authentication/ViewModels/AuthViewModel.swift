//
//  AuthViewModel.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 17.08.2022.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var addPhoto: Bool = false {
        willSet {
            print("willSet addPhoto - \(newValue)")
        }
    }
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(String(describing: self.userSession?.uid))")
    }
    
    // sign in
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Faild to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Sign in user successfully")
            print("DEBUG: User is the \(String(describing: self.userSession?.uid))")
        }
    }
    
    // sign up
    func register(withEmail email: String, password: String, fullname: String, username: String) {
     
        Auth.auth().createUser(withEmail: email, password: password) { [unowned self] result, error in
            if let error = error {
                print("DEBUG: Faild to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
//            self.userSession = user

            print("DEBUG: Register user successfully")
//            print("DEBUG: User is \(String(describing: self.userSession))")

            // save user authentication to Firebase Dastabase
            // cretate an array
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { [unowned self]_ in
                    
                    self.addPhoto = true
//                    print("firestore - \(self.addPhoto)")
                }
        }
    }
    
    func signOut() {
        // set user session to nil so we show LoginView
        userSession = nil
        try? Auth.auth().signOut()
    }
}
