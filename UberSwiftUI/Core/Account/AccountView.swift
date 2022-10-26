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
                    ForEach((0...2), id: \.self){ _ in
                        AccountCell()
                    }
                }
                
                Button(action: {
                    print("DEBUG: handle lout out")
                }, label: {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.red)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                        .padding()
                        
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
