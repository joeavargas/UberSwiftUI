//
//  User.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 11/16/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
