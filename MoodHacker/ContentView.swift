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
        Text("Sign up").frame(maxWidth:200).padding().font(.title3).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
    }
}

struct logInbtn: View {
    var body: some View{
        Text("Log in").frame(maxWidth:200).padding().font(.title3).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
    }
}



struct signUpPage: View{
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    var body: some View{
        NavigationView{
            
        
            ZStack{
                Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack{
                    Image("Image").resizable().aspectRatio(contentMode:.fit).frame(width:200, height: 150)
                    Text("Mood Hacker").font(.title).fontWeight(.bold).padding(.all)
                    Text("create a new account").foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.704, green: 0.401, blue: 1.001)/*@END_MENU_TOKEN@*/).padding(.bottom)
                    
                    VStack{
                        InputView(text: $email, placeholder: "Email")
                        
                        InputView(text: $name, placeholder: "Name")
                        
                        InputView(text: $password, placeholder: "Enter your Password", isSecureField:true)
                        
                        InputView(text: $confirmPassword, placeholder: "Confirm Password", isSecureField:true)
                        
                    }.padding(.horizontal).padding(.top, 12);
                    
                    
                    signUpBtn().padding(.top)
                    
                    HStack{
                        
                        Text("Already have an account?").foregroundColor(.black)
                        
                        NavigationLink(destination: logInScreen(), label:{
                            Text("Login").foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
                        }).navigationBarHidden(true).fontWeight(.bold)
                        
                    }.padding(.top)
                }
            }
            
        }
        
    }
}

struct logInScreen : View{
    @State private var email : String = ""
    @State private var password : String = ""
    var body: some View{
        
        ZStack{
            Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("Image").resizable().aspectRatio(contentMode:.fit).frame(width:200, height: 150)
                Text("Mood Hacker").font(.title).fontWeight(.bold).padding(.all)
                Text("Create a new account").foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.704, green: 0.401, blue: 1.001)/*@END_MENU_TOKEN@*/).padding(.bottom)
                
                VStack{
                    InputView(text: $email, placeholder: "Email")
                    
                    InputView(text: $password, placeholder: "Password", isSecureField:true)
                }.padding(.horizontal).padding(.top, 12);
                
                logInbtn().padding(.top)
                
                HStack{
                    
                    Text("New user?").foregroundColor(.black)
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label:{
                        Text("Sign Up").foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
                    }).navigationBarHidden(true).fontWeight(.bold)
                    
                }.padding(.top)
            }
        }
    }
}

