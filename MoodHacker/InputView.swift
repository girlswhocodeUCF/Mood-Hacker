//
//  InputView.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 4/12/24.
//

import SwiftUI
struct InputView: View{
    @Binding var text: String
  
    let placeholder: String
    var isSecureField = false
    
    var body: some View{
        VStack(alignment: .leading, spacing: 12){
            
            if isSecureField {
                SecureField(placeholder, text: $text).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 14)).background(Color.white).cornerRadius(20).padding(.bottom, 18);
            }else {
                TextField(placeholder, text: $text).padding(.all, 10).frame(maxWidth:290).font(.custom("SometypeMono-Regular", size: 14)).background(Color.white).cornerRadius(20).padding(.bottom, 18);
            }
            
        }
    }
    
}

struct InputView_Previews: PreviewProvider{
    static var previews: some View{
        InputView(text: .constant(""), placeholder: "name@example.com")
    }
}
