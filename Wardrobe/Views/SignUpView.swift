//
//  SignUpView.swift
//  Wardrobe
//
//  Created by Jason on 5/7/22.
//

import SwiftUI

struct SignUpView: View {
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AppViewModel())
    }
}
