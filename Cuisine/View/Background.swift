//
//  Background.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct Background: View {
    
    @State private var var_x = 1
    
    var blurred: Bool
    
    var body: some View {
//        if blurred{
            ZStack{
                
                
                
                Capsule().fill(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .padding(.top, 40)
                    .padding(.bottom, 40)
                    .border(Color.blue, width: 0.5)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 15).padding(.trailing,15).padding(.bottom, 20).padding(.top, 10))
                
                    .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 35).padding(.trailing,35).padding(.bottom, 40).padding(.top, 40))
                    
                    
                    
                Circle().trim(from: 0.5, to: 1.0).opacity(0)
                    .background(Circle().trim(from: 0.5, to: 1.0).foregroundColor(Color.black))
//                    .trim(from: 0.5, to: 1)
                    .padding(.leading, 35)
                    .padding(.trailing,35)
                    .padding(.bottom,500)
                    
//                can't fill and trim at the same time
                    
                    
//                    .strokeBorder(Color.black, lineWidth: 20)
//                    .background(Circle().fill(Color.blue))
                
                
              
                
        
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 150,height: 100)
                    .offset(x: CGFloat(-var_x*600+200), y: 200)
                    .animation(.easeInOut(duration: 5).repeatForever())
                    .onAppear { self.var_x *= -1}
                    
                
                
          }
            .background(Color.gray)
            .ignoresSafeArea()
            
//        }else{
//            Image("airplaneWindow2")
//                .resizable()
//                .ignoresSafeArea()
//                .frame(width: 650)
//        }
        
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(blurred: false)
    }
}
