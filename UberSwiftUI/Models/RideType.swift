//
//  RideType.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/20/22.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX, black, uberXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX: return "UberX"
        case .black: return "UberBlack"
        case .uberXL: return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "uber-x"
        case .black: return "uber-black"
        case .uberXL: return "uber-x"
        }
    }
}
