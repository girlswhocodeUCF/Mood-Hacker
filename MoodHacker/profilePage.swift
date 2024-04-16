//
//  profilePage.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 4/16/24.
//

import Foundation
import SwiftUI

//this is just for viewing your own profile data and signing out
struct profilePage: View{
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        
            VStack {
                Text("user").fontWeight(.semibold).padding(.top, 4)
                
                Button{
                    viewModel.signOut()
                }label:{
                    Text("Sign Out ").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
                }.padding(.top)
                
                Button{
                    viewModel.deleteAccount()
                }label:{
                    Text("Delete Account ").frame(maxWidth:200).padding().font(.custom("SometypeMono-Regular", size: 16)).background(Color(red: 0.7, green:0.4, blue: 1)).foregroundColor(Color.white).cornerRadius(50)
                }.padding(.top)
            
        }
    }
}


struct profilePage_Previews: PreviewProvider{
    static var previews: some View {
        profilePage()
    }
}

