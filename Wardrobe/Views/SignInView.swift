//
//  SignInView.swift
//  Wardrobe
//
//  Created by Jason on 5/7/22.
//

import SwiftUI


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AppViewModel())
    }
}
