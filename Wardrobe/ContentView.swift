//
//  ContentView.swift
//  Wardrobe
//
//  Created by Jason on 4/2/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class APPViewModel: ObservableObject {
    
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
                        password: password) { [weak self] result,
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
    @EnvironmentObject var viewModel: APPViewModel
    
   var body: some View {
        NavigationView {
            if viewModel.signedIn {
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

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: APPViewModel
    
   var body: some View {
            VStack {
                
                Image("Wardrobe_HomeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action:{
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                            
                        
                    })
                    
                    NavigationLink("Create account", destination: SignUpView())
                        .padding()
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Sign In")
            .foregroundColor(Color.black)
            .background(Image("Wardrobe_BG"))
    }
        
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: APPViewModel
    
   var body: some View {
            VStack {
                
                Image("Wardrobe_HomeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action:{
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                        
                    }, label: {
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                            
                        
                    })
                       
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Create account")
            .foregroundColor(Color.black)
            .background(Image("Wardrobe_BG"))
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

