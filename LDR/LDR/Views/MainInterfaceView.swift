//
//  ContentView.swift
//  Application
//
//  Created by Shihang Wei on 12/25/23.
//

import SwiftUI

struct MainInterfaceView: View {
    //var interface: MainInterfaceViewModel
    @StateObject var interface = MainInterfaceViewModel()
    @State var selection = 0
    
    var body: some View {
        //Text("\(interface.currentUserId)")
        if interface.isSignIn {
            TabView(selection: $selection) {
                UserEditView(tabSelection: $selection)
                    .tabItem { Label("Edit", systemImage: "figure") }
                    .tag(1)
                
                OthersDisplayView()
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(0)
                
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
                    .navigationTitle("Profile")
                    .tag(2)
            }
        } else {
            NavigationStack {
                LoginView()
            }
        }
    }
}

#Preview {
    MainInterfaceView()
}
