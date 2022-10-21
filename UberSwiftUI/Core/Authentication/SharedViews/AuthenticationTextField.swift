//
//  AuthenticationTextField.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/21/22.
//

import SwiftUI

struct AuthenticationTextField: View {
    
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }
            .foregroundColor(.white)
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}
