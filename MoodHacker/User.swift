//
//  User.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 4/12/24.
//

import Foundation


//User Object for Authentication :]

struct User: Identifiable, Codable{
    let id : String
    let fullname : String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Kobe Bryant", email: "poop@gmail.com")
}
