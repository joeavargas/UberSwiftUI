//
//  SettingsHeaderView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountHeaderView: View {
    
    var body: some View {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tony Stark")
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

struct AccountHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHeaderView()
            .preferredColorScheme(.light)
        AccountHeaderView()
            .preferredColorScheme(.dark)
    }
}
