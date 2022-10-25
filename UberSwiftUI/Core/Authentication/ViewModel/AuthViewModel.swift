//
//  AuthViewModel.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/23/22.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    
    func login() {
        print("DEBUG: log in user from vm")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to register user with error: ", error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data: [String:Any] = ["email":email,
                                      "username": username,
                                      "fullname": fullname]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func uploadProfileImage() {
        print("DEBUG: upload profile image")
    }
    
    func signOut() {
        
    }
    
}
