//
//  Cloud.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-09-22.
//

import SwiftUI

struct Cloud: View {
    var body: some View {
        
        ZStack{
        
//
        
//        Capsule().fill(Color(red: 0.4627, green: 0.8392, blue: 1.0))
//            .padding(.leading, 35)
//            .padding(.trailing, 35)
//            .padding(.top, 40)
//            .padding(.bottom, 40)
        
//        Rectangle().fill(Color.gray)
        Capsule()
            .padding(.leading, 35)
            .padding(.trailing, 35)
            .padding(.top, 40)
            .padding(.bottom, 40)
            .border(Color.blue, width: 0.5)
            .opacity(0)
            .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 15).padding(.trailing,15).padding(.bottom, 20).padding(.top, 10))
        
            .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 35).padding(.trailing,35).padding(.bottom, 40).padding(.top, 40))
            
            
            
        Circle().trim(from: 0.5, to: 1.0).opacity(0)
            .background(Circle().trim(from: 0.5, to: 1.0).foregroundColor(Color.black))
//                    .trim(from: 0.5, to: 1)
            .padding(.leading, 35)
            .padding(.trailing,35)
            .padding(.bottom,500)
            
           
            
        }
        .ignoresSafeArea()
    }
    
}

struct Cloud_Previews: PreviewProvider {
    static var previews: some View {
        Cloud()
    }
}
