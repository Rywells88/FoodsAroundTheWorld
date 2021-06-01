//
//  Background.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct Background: View {
    
    var blurred: Bool
    
    var body: some View {
        if blurred{
            Image("prague")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 2.0)
        }else{
            Image("prague")
                .resizable()
                .ignoresSafeArea()
        }
        
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(blurred: false)
    }
}
