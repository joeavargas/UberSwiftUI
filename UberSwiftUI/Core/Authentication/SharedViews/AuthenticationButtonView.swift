//
//  AuthenticationButtonView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AuthenticationButtonView: View {
    let backgroundColor: Color
    let label: String
    var body: some View {
        Text(label)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(backgroundColor)
            .clipShape(Rectangle())
            .cornerRadius(8)
            .padding()
    }
}
