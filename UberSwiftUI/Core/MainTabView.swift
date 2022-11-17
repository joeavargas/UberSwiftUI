//
//  MainTabView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/24/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        if let user = authVM.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    HomeView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem{(
                            VStack {
                                Image(systemName: "house")
                                Text("Home")
                        })}
                        .tag(0)
                    
                    ActivityView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem{(
                            VStack {
                            Image(systemName: "list.bullet.rectangle.portrait")
                            Text("Activity")
                        })}
                        .tag(1)
                    
                    AccountView(user: user)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem{(VStack {
                            Image(systemName: "person.fill")
                            Text("Account")
                        })}
                        .tag(2)
                }
                .navigationTitle(tabTitle)
                .onAppear{
                    if #available(iOS 15, *) {
                        let appearance = UITabBarAppearance()
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                    }
                }
            }
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return ""
        case 1: return "Activity"
        case 2: return "Account"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
