//
//  MainpageView.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 4/1/24.
//

import SwiftUI
import SwiftData

struct MainpageView: View {
    var body: some View {
        mainPage()
    }
}


struct MainpageView_Previews: PreviewProvider{
    static var previews: some View {
        MainpageView()
    }
}

struct mainPage: View{
    var body: some View{
        
        ZStack{
            Color(red: 0.7, green:0.4, blue: 1).edgesIgnoringSafeArea(.all)
            
            Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(.bottom)
            
            Circle().trim(from: 0.0, to: 0.50).position(x:215).frame(width: 430).foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
        }
        
    }
}
