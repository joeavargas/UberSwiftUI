//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/13/22.
//

import SwiftUI
import Firebase

@main
struct UberSwiftUIApp: App {
    //    @StateObject var locationSearchVM = LocationSearchViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            HomeView()
//                .environmentObject(locationSearchVM)
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}
