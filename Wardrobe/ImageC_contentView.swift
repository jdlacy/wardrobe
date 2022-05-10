//
//  ImageC_contentView.swift
//  Wardrobe
//
//  Created by Sean Jones on 5/6/22.
//

import SwiftUI

struct ImageC_contentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        let scale: CGFloat = 2
        return scale
    }
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(0..<20) { num in
                            GeometryReader { proxy in
                                let x = proxy.frame(in: .global).minX
                                let scale = getScale(proxy: proxy)
                                
                                Image("Wardrobe_1")
                                    .resizable()
                                    .scaledToFill()
                            //Text(x.description)
                                    //.font(.system(size: 30, weight: .bold))
                            
                        }
                        .background(Color.red)
                        .frame(width: 100, height: 150)
                    }
                }
            }.navigationTitle("My Tops")
        }
    }
}

struct ImageC_contentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageC_contentView()
    }
}
}
