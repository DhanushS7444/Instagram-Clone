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
                Home().navigationBarTitle("Instagram")
                    .navigationBarItems(leading: Button(action: {
                        
                    }, label: {
                        Image("Cam").resizable().frame(width: 30, height: 30)
                    }).foregroundColor(Color("darkAndWhite"))
                        ,trailing:
                        HStack{
                            Button(action: {
                                
                            }) {
                                 Image("IGTV").resizable().frame(width: 30, height: 30)
                            }.foregroundColor(Color("darkAndWhite"))
                            Button(action: {
                                
                            }) {
                                 Image("Send").resizable().frame(width: 30, height: 30)
                            }.foregroundColor(Color("darkAndWhite"))
                        }
                )
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

struct Home : View {
    var body : some View {
         Text("Home")
    }
}
