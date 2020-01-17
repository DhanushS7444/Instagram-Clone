//
//  ContentView.swift
//  Instagram
//
//  Created by Dhanush S on 16/01/20.
//  Copyright © 2020 Dhanush S. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView{
                Text("Home")
            }.tabItem{
                Image("Home")
            }
            Text("Find").tabItem{
                Image("Find")
            }
            Text("Upload").tabItem{
                Image("Plus")
            }
            Text("Likes").tabItem{
                Image("Heart")
            }
            Text("Profile").tabItem{
                Image("People")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
