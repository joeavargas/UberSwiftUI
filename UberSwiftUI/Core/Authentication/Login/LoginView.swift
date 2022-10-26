//
//  LoginView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/20/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.customGrayColor
                VStack {
                    //MARK: uber title
                    Text("UBER")
                        .foregroundColor(.white)
                        .font(Font.custom("Avenir-Light", size: 36))
                    
                    VStack(spacing: 40) {
                        //MARK: email textfield
                        AuthenticationTextField(imageName: "envelope",
                                                placeholderText: "Email",
                                                isSecureField: false,
                                                text: $email)
                        
                        //MARK: password textfield
                        AuthenticationTextField(imageName: "lock",
                                                placeholderText: "Password",
                                                isSecureField: true,
                                                text: $password)
                    }
                    .padding([.top, .horizontal], 32)
                    
                    //MARK: forgot password button
                    //TODO: Impement logic to handle password reset
//                    HStack{
//                        Spacer()
//
//                        // MARK: Forgot password link
//                        NavigationLink(
//                            destination: Text("Reset password"),
//                            label: {
//                                Text("Forgot password?")
//                                    .font(.system(size: 13, weight: .semibold))
//                                    .padding(.top)
//                                    .padding(.trailing, 28)
//                            })
//                    }
                    
                    // MARK: log In button
                    Button(action: {
                        authVM.login()
                    }, label: {
                        AuthenticationButtonView(backgroundColor: .blue, label: "Log In")
                    })
                    .padding(.top, 32) //TODO: 👈🏼 remove padding when "forgot password" button is implemented
                    
                    Spacer()
                    
                    // MARK: "don't have an account" link
                    NavigationLink(
                        destination: RegistrationView()
                            .navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                Text("Sign up!")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }).padding(.bottom, 32)
                    
                }
                .padding(.top, 100)
            }
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
