//
//  AccountView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            Color.theme.secondaryBackgroundColor
            
            VStack(spacing: 32) {
                AccountHeaderView()
                
                VStack(spacing: 1) {
                    ForEach((AccountCellViewModel.allCases), id: \.self){ viewModel in
                        AccountCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    print("DEBUG: handle lout out")
                }, label: {
                    AuthenticationButtonView(backgroundColor: .red, label: "Log Out")
                })
                
                Spacer()
            }
            .background(Color.theme.secondaryBackgroundColor)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .preferredColorScheme(.dark)
        AccountView()
            .preferredColorScheme(.light)
    }
}
