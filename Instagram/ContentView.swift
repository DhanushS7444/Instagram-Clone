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
    @ObservedObject var observed = observer()
    
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(observed.status){i in
                            StatusCard(imName: i.name)
                                .padding(.leading,10)
                        }
                    }
                }
                ForEach(0..<8){_ in
                    PostCard(user: "", image: "", id: "")
                }
            }
        }.animation(.spring())
    }
}

struct StatusCard : View {
    var imName =  ""
    var body : some View{
        Image(imName)
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

struct PostCard : View {
    var user = ""
    var image = ""
    var id = ""
    
    var body : some View{
        VStack(alignment: .leading, content:{
            HStack{
                Image("Dhanush").resizable().frame(width: 30, height: 30).clipShape(Circle())
                Text("User")
                Spacer()
                Button(action: {
                    
                }) {
                    Image("Menu").resizable().frame(width: 15, height: 15)
                }.foregroundColor(Color("darkAndWhite"))
            }
            Image("Dhanush").resizable().frame(height: 350)
            
            HStack{
                Button(action: {
                    
                }) {
                    Image("Comment").resizable().frame(width: 26, height: 26)
                }.foregroundColor(Color("darkAndWhite"))
                
                Button(action: {
                    
                }) {
                    Image("Heart").resizable().frame(width: 26, height: 26)
                }.foregroundColor(Color("darkAndWhite"))
                Spacer()
                Button(action: {
                    
                }) {
                    Image("Saved").resizable().frame(width: 30, height: 30)
                }.foregroundColor(Color("darkAndWhite"))
            }
            .padding(.top,8)
            Text("2 Likes").padding(.top, 8)
            Text("View all 3 Comments")
        }).padding(8)
    }
}


class observer : ObservableObject{
    @Published var status = [datatype]()
    init() {
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener{(snap,err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                if i.type == .added{
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    self.status.append(datatype(id: id, name: name, image: image))
                }
            }
        }
    }
}

struct datatype : Identifiable{
    var id : String
    var name : String
    var image : String
}
