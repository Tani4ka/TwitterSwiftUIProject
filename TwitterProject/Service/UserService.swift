//
//  UserService.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 21.08.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String) {
        
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                print("DEBUG: Username is \(user.username)")
                print("DEBUG: Email is \(user.email)")
            }
    }
}
