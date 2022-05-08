//
//  ContentView.swift
//  Wardrobe
//
//  Created by Jason on 4/2/22.
//

import SwiftUI
import FirebaseAuth

public class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) {[weak self] result,
                    error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
            self?.signedIn = true
        }
    }
}
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email,
                        password: password) {[weak self] result,
                error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
            self?.signedIn = true
        }
    }
}
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if Auth.auth().currentUser != nil {
                VStack {
                    Text("You are currently signed in")
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Sing out")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.red)
                })
            }
            
                
        }
            else {
                SignInView() //probably link to home view here if viewModel.signedIn { HomeView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}

