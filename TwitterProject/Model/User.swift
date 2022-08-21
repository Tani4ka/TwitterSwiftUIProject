//
//  User.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 22.08.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullnane: String
    let profileImageUrl: String
    let email: String
}
