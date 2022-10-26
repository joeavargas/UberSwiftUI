//
//  AccountCell.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

struct AccountCell: View {
    let viewModel: AccountCellViewModel
    var body: some View {
        VStack {
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text(viewModel.title)
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

