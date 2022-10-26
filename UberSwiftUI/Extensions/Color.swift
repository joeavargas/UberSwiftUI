//
//  Color.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/20/22.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
    let customGrayColor = Color("CustomGray")
    let accountCellColor = Color("AccountCellColor")
}
