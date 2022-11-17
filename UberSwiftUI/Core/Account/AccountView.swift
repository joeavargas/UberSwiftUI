//
//  AccountView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color.theme.secondaryBackgroundColor
            
            VStack(spacing: 32) {
                AccountHeaderView(user: user)
                
                VStack(spacing: 1) {
                    ForEach((AccountCellViewModel.allCases), id: \.self){ viewModel in
                        AccountCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    AuthViewModel.shared.signOut()
                }, label: {
                    AuthenticationButtonView(backgroundColor: .red, label: "Log Out")
                })
                
                Spacer()
            }
            .background(Color.theme.secondaryBackgroundColor)
        }
    }
}
