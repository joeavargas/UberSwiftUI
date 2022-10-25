//
//  MainTabView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/24/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem{(Image(systemName: "house"))}
                    .background(.white)
                
                Text("Activity")
                    .tabItem{(Image(systemName: "list.bullet.rectangle.portrait"))}
                
                Text("Account")
                    .tabItem{(Image(systemName: "person.fill"))}
            }
            .onAppear{
                if #available(iOS 15, *) {
                    let appearance = UITabBarAppearance()
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
            }
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
