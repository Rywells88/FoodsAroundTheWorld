//
//  AboutMe.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-10-12.
//

import SwiftUI

struct AboutMe: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            
            HStack {
                Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
                .foregroundColor(Color.blue)
                .edgesIgnoringSafeArea(.all)
                .padding(10)
            
                Spacer()
            }
        
        Text("About & Credits")
            .font(.title)
            
        Spacer()
            
        Text("Created by Ryley Wells in 2021.")
            .padding(.top, 5)
        Link("Icons by icons8 ", destination: URL(string:"https://icons8.com")!)
            .padding(.top, 5)
            
        Link("WikipediaKit was created by Frank Rausch (@frankrausch) for Raureif.", destination: URL(string: "https://github.com/Raureif/WikipediaKit")!)
            .padding(5)
            .lineLimit(2)
            .frame(width: 400, height: 150, alignment: .center)
            
        
        }
        .padding(.bottom, 200)
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
