//
//  TabBarView.swift
//  Wardrobe
//
//  Created by Student Account on 4/21/22.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
        
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            Wardrobe()
                .tabItem {
                    Label("Wardrobe", systemImage: "tshirt.fill")
                }
                .tag(1)
            Closet()
                .tabItem {
                    Label("My Closet", systemImage: "house")
                }
                .tag(2)
            }
          
            //button is just to test out in preview mode
            Button(action: {
                selection = (selection + 1) % 3
            }) {
                Text("Next")
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
            }
        }
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
