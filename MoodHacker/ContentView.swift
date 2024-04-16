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
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainpageView()
            } else {
                signUpPage()
            }
        }
        
//        //if you want to preview, comment above, and uncomment this
//        signUpPage()
    
    }

}


struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}


struct signUpPage: View{
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
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
                    
                    

                    VStack{
                        InputView(text: $email, placeholder: "Email")
                        
                        InputView(text: $name, placeholder: "Name")
                        
                        InputView(text: $password, placeholder: "Enter your Password", isSecureField:true)
                        
                        InputView(text: $confirmPassword, placeholder: "Confirm Password", isSecureField:true)
                        
                    }.padding(.horizontal).padding(.top, 12);

                    
                    
                    Button{
                        Task {
                            try await viewModel.createUser(withEmail:email, password: password, fullname:name)
                        }
                    }label:{
                        
                        Text("Sign up").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
                    }.padding(.top)
                    
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
    @State private var email : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    
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
                
                
                VStack{
                    InputView(text: $email, placeholder: "Email")
                    
                    InputView(text: $password, placeholder: "Password", isSecureField:true)
                }.padding(.horizontal).padding(.top, 12);
                
                Button{
                    Task {
                        try await viewModel.signIn(withEmail:email, password: password)
                    }
                }label:{
                    
                    Text("Log in").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
                }.padding(.top)
    
                
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

