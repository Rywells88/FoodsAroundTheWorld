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
            .frame(minWidth: 400, idealWidth: 400, maxWidth: .infinity, minHeight: 250, idealHeight: 200, maxHeight: 200, alignment: .center)
        Text("Created by Ryley Wells in 2021.")
        Link("Icons by icons8 ", destination: URL(string:"https://icons8.com")!)
            
        Link("WikipediaKit was created by Frank Rausch (@frankrausch) for Raureif.", destination: URL(string: "https://github.com/Raureif/WikipediaKit")!)
            
        
        }
        .padding(.bottom, 200)
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
