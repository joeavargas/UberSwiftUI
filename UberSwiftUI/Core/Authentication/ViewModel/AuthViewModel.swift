//
//  AuthViewModel.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/23/22.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    
    func login() {
        print("DEBUG: log in user from vm")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to register user with error: ", error.localizedDescription)
                return
            }
            
            print("DEBUG: successfully register user with firebase 🙌🏻")
            
        }
    }
    
    func uploadProfileImage() {
        
    }
    
    func signOut() {
        
    }
    
}
