//
//  ContentView_Wardrobe.swift
//  Wardrobe
//
//  Created by Sean Jones on 5/18/22.
//

import SwiftUI

import SwiftUI

 
 

struct ContentView_Wardrobe: View {

     

    private func getScale(proxy: GeometryProxy) -> CGFloat {

        var scale: CGFloat = 1

         

        let x = proxy.frame(in: .global).minX

         

        let myfunc = abs(x)

        if myfunc < 100 {

            scale = 1 + (100 - myfunc) / 500

        }

         

        return scale

    }

    var body: some View {

        VStack {

        HStack {

        NavigationView {

            ScrollView {

                ScrollView(.horizontal) {

                    HStack(spacing: 16) {

                        ForEach(0..<20) { num in

                            GeometryReader { proxy in

                                 

                                let x = proxy.frame(in: .global).minX

                                let scale = getScale(proxy: proxy)

                                 

                                Image("Wardrobe_Top")

                                    .resizable()

                                    .scaledToFill()

                                     

                                    .scaleEffect(CGSize(width:

                                    scale, height: scale))

                            //Text(x.description)

                                    //.font(.system(size: 30, weight: .bold))

                             

                        }

                        .background(Color.white)

                        .frame(width: 200, height: 200)

                    }

                }

                }

                     

                HStack {

                    ScrollView {

                        ScrollView(.horizontal) {

                            HStack(spacing: 16) {

                                ForEach(0..<20) { num in

                                    GeometryReader { proxy in

                                        let x = proxy.frame(in: .global).minX

                                        let scale = getScale(proxy: proxy)

                                         

                                        Image("Wardrobe_pants")

                                            .resizable()

                                            .scaledToFill()

                                    //Text(x.description)

                                            //.font(.system(size: 30, weight: .bold))

                                     

                                }

                                .background(Color.red)

                                .frame(width: 250, height: 200)

                            }

                        }

                        }

                        HStack {

                            ScrollView {

                                ScrollView(.horizontal) {

                                    HStack(spacing: 16) {

                                        ForEach(0..<20) { num in

                                            GeometryReader { proxy in

                                                let x = proxy.frame(in: .global).minX

                                                let scale = getScale(proxy: proxy)

                                                 

                                                Image("Wardrobe_shoes")

                                                    .resizable()

                                                    .scaledToFill()

                                            //Text(x.description)

                                                    //.font(.system(size: 30, weight: .bold))

                                             

                                        }

                                        .background(Color.red)

                                        .frame(width: 250, height: 200)

                                    }

                                }

                                }

                                 

                            }

            }.navigationTitle("My wardrobe")

        }

    }

}

        }

    }

        }

    }

    }

struct ContentView_Wardrobe_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}
