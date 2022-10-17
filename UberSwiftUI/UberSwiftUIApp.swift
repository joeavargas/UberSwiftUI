//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/13/22.
//

import SwiftUI

@main
struct UberSwiftUIApp: App {
    @StateObject var locationSearchVM = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeVIew()
                .environmentObject(locationSearchVM)
        }
    }
}
