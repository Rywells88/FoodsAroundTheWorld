//
//  Background.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct Background: View {
    
    @State private var var_x1 = 1
    @State private var var_x2 = 1
    @State private var var_x3 = 1
    @State private var var_x4 = 1
    @State private var var_x5 = 1
    
    var blurred: Bool
    
    var body: some View {
            ZStack{
                

                
                
                Capsule().fill(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .ignoresSafeArea()
                
                    
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 120,height: 100)
                    .offset(x: CGFloat(350*Double(var_x1) + 1.0), y: 10)
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: false))
                    .onAppear { self.var_x1 *= -1}
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x2) + 1.0), y: 200)
                    .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false))
                    .onAppear { self.var_x2 *= -1}
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x3) + 10.0), y: 150)
                    .animation(.easeInOut(duration: 12).repeatForever(autoreverses: false))
                    .onAppear { self.var_x3 *= -1}
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 120,height: 100)
                    .offset(x: CGFloat(350*Double(var_x4) + 5.0), y: -70)
                    .animation(.easeInOut(duration: 8).repeatForever(autoreverses: false))
                    .onAppear { self.var_x4 *= -1}
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x5) + 10.0), y: -120)
                    .animation(.easeInOut(duration: 15).repeatForever(autoreverses: false))
                    .onAppear { self.var_x5 *= -1}
                Image("AirplaneWindow")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(-90)
                    .padding(.top, 45)
                
               
          }
            .ignoresSafeArea()
        
            
        
    }
    
}


struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(blurred: false)
    }
}
