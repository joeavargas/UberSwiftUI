//
//  RegistrationView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/21/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    var body: some View {
            ZStack {
                Color.theme.customGrayColor
                VStack {
                    // MARK: uber title
                    Text("UBER")
                        .foregroundColor(.white)
                        .font(Font.custom("Avenir-Light", size: 36))
                    
                    VStack(spacing: 32){
                        //MARK: email textfield
                        AuthenticationTextField(imageName: "envelope",
                                                placeholderText: "Email",
                                                isSecureField: false,
                                                text: $email)
                        
                        //MARK: full name textfield
                        AuthenticationTextField(imageName: "person", placeholderText: "Full name", isSecureField: false, text: $fullname)
                        
                        //MARK: password textfield
                        AuthenticationTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                        
                        
                    }
                    .padding([.top, .horizontal], 32)
                    
                    //MARK: register button
                    Button(action: {
                        print("DEBUG: register user")
                    }, label: {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.blue)
                            .clipShape(Rectangle())
                            .cornerRadius(8)
                            .padding()
                    })
                    .padding(.top, 24)
                    
                    Spacer()
                    
                    //MARK: "already have an account" link
                    Button(action: {
                        print("DEBUG: dismiss to LoginView")
                    }, label: {
                        HStack{
                            Text("Already have an account?")
                                .font(.system(size: 14))
                                .foregroundColor(.white )
                            Text("Sign in!")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }).padding(.bottom, 32)
                }
                .padding(.top, 100)
            }
            .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
