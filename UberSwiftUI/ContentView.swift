//
//  ContentView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationSearchVM = LocationSearchViewModel()
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        Group {
            if authVM.userSession != nil {
                MainTabView()
                    .environmentObject(locationSearchVM)
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
