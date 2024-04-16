//
//  AuthViewModel.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 4/12/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFromProtocol {
    var formIsValid: Bool {get }
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail:email, password:password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("Failed to log in with user \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname : fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            await fetchUser()
        } catch {
            
            print("Failed to create user with error \(error.localizedDescription)")
            
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil //back to login screen!
            self.currentUser = nil //gets rid of the current user data
        } catch {
            print("Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
        
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("Crrent user is \(self.currentUser)")
    }
    
}

