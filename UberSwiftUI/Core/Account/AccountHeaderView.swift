//
//  SettingsHeaderView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountHeaderView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname )
                        .font(.system(size: 18))
                    Text("Available")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                
                Spacer()
            }
            .frame(height: 80)
            .background(Color.theme.accountCellColor)
            .padding(.top)
    }
}
