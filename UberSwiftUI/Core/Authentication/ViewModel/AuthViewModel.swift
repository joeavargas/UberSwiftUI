//
//  AuthViewModel.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/23/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to sign in user with error: ", error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to register user with error: ", error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            
            let data: [String:Any] = ["email":email,
                                      "username": username,
                                      "fullname": fullname]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": imageUrl]){ _ in
                    print("DEBUG: Successfully updated user data")
                    self.userSession = self.tempCurrentUser
                }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user
        }
    }
    
    func uploadImageLater() {
        self.userSession = self.tempCurrentUser
    }
    
    func signOut() {
        self.userSession = nil
        self.didAuthenticateUser = false
        try? Auth.auth().signOut()
    }
    
}
