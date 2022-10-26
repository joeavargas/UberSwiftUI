//
//  AccountCell.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountCell: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "key.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text("Account")
                    .font(.system(size: 15))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }
        .background(Color.theme.accountCellColor)
    }
}

struct AccountCell_Previews: PreviewProvider {
    static var previews: some View {
        AccountCell()
            .preferredColorScheme(.light)
        AccountCell()
            .preferredColorScheme(.dark)
    }
}
