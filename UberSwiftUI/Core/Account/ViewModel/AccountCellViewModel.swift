//
//  AccountCellViewModel.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/25/22.
//

import SwiftUI

enum AccountCellViewModel: Int, CaseIterable {
    case notifications, referAFriend, rideHistory, payment, rewards, donate, settings
    
    var title: String {
        switch self {
        case .notifications: return "Notifications"
        case .referAFriend: return "Refer a friend"
        case .rideHistory: return "Ride history"
        case .payment: return "Payment"
        case .rewards: return "Rewards"
        case .donate: return "Donate"
        case .settings: return "Settings"
        }
    }
    
    var imageName: String {
        switch self {
        case .notifications: return "bell.badge"
        case .referAFriend: return "gift"
        case .rideHistory: return "clock.arrow.circlepath"
        case .payment: return "creditcard"
        case .rewards: return "giftcard"
        case .donate: return "heart"
        case .settings: return "gearshape"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            
        case .notifications: return .blue
        case .referAFriend: return .red
        case .rideHistory: return .yellow
        case .payment: return .green
        case .rewards: return .teal
        case .donate: return .pink
        case .settings: return .clear
        }
    }
}
