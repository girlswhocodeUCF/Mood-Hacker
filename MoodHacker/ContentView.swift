//
//  ContentView.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 3/29/24.
//

// write some code

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        signUpPage()
    }
}


struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

struct signUpBtn: View {
    var body: some View{
        Text("Sign in").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
    }
}

struct logInbtn: View {
    var body: some View{
        Text("Log in").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
    }
}



struct signUpPage: View{
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    var body: some View{
        NavigationView{
            
        
            ZStack{
                Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack{
                    Image("Image").resizable().aspectRatio(contentMode:.fit).frame(width:200, height: 150)
                    Text("Mood Hacker")
                        .font(.custom("SometypeMono-Regular", size: 32)).fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .foregroundColor(.black)
                        
                    Text("create a new account").foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.704, green: 0.401, blue: 1.001)/*@END_MENU_TOKEN@*/).padding(.bottom)
                        .font(.custom("SometypeMono-Regular", size: 16))
                    
                    
                    
                    TextField("Username", text: $username).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.all)
                        .foregroundColor(.black)
                        .accentColor(.purple)
                    
                    TextField("Email", text: $email).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.bottom)
                        .foregroundColor(.black)
                        .accentColor(.purple)
                    
                    TextField("Password", text: $password).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.bottom)
                        .foregroundColor(.black)
                        .accentColor(.purple)
                    
                    TextField("Confirm Password", text: $password).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.bottom)
                        .foregroundColor(.black)
                        .accentColor(.purple)
                    
                    
                    signUpBtn().padding(.top)
                    
                    HStack{
                        
                        Text("Already have an account?").foregroundColor(.black)
                            .font(.custom("SometypeMono-Regular", size: 14))
                        
                        NavigationLink(destination: logInScreen(), label:{
                            Text("Login").font(.custom("SometypeMono-Regular", size: 14)).foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
                        }).navigationBarHidden(true).fontWeight(.bold)
                        
                    }.padding(.top)
                }
            }
            
        }
        
    }
}

struct logInScreen : View{
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    var body: some View{
        
        ZStack{
            Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("Image").resizable().aspectRatio(contentMode:.fit).frame(width:200, height: 150)
                Text("Mood Hacker")
                    .font(.custom("SometypeMono-Regular", size: 32)).fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .foregroundColor(.black)
                
                Text("create a new account").foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.704, green: 0.401, blue: 1.001)/*@END_MENU_TOKEN@*/).padding(.bottom)
                    .font(.custom("SometypeMono-Regular", size: 16))
                
                TextField("Username", text: $username).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.all)
                    .accentColor(.purple)
                
                TextField("Password", text: $password).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 20)).background(Color.white).cornerRadius(20).padding(.bottom)
                    .accentColor(.purple)
                
                
                logInbtn().padding(.top)
                
                HStack{
                    
                    Text("New user?").font(.custom("SometypeMono-Regular", size: 14)).foregroundColor(.black)
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label:{
                        Text("Sign Up").font(.custom("SometypeMono-Regular", size: 14)).foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
                    }).navigationBarHidden(true).fontWeight(.bold)
                    
                }.padding(.top)
            }
        }
    }
}

