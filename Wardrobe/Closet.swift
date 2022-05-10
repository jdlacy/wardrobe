//
//  Closet.swift
//  Wardrobe
//
//  Created by Student Account on 4/21/22.
//

import SwiftUI

struct Closet: View {
    var body: some View {
        Text("Your Closet")
        
        VStack() {
            Text("Head")
                .padding()
            Text("Torso")
                .padding()
            Text("Legs")
                .padding()
            Text("Feet")
                .padding()
            Text("Accessories")
                .padding()
        }
    }
}

struct Closet_Previews: PreviewProvider {
    static var previews: some View {
        Closet()
    }
}
