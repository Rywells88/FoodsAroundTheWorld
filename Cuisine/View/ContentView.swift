//
//  ContentView.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
                    .combined(with: .opacity)
                let removal = AnyTransition.scale
                    .combined(with: .opacity)
                return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct ContentView: View {
    
    @State private var departButton = false
    
    var body: some View {
        ZStack {
            Background(blurred: false)
            VStack(alignment: .center) {
                Text("Cuisine's Around the World")
                    .font(.title)
                    .padding(.top, 10)
        

                Text("Experience food from around the world")
                    .font(.subheadline)
                    .padding(.top, 5)

                Button(action: {
                    withAnimation {
                        self.departButton.toggle()
                    }
                }) {
                    Image(systemName: "chevron.up.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(departButton ? 180 : 0))
                            .scaleEffect(departButton ? 1.5 : 1)
                            .padding()
                }
    
                Spacer()
                if departButton {
                    DailyCuisine()
                        .transition(.slide)
                        .frame(width: 400, height: 550, alignment: .center)
                        .background(Color.white).opacity(0.9)
                        .padding(.bottom, 40)
                        .padding(.top, 110)
                }
                
                
                   
            }
            Text("Prague, Czech Republic")
                .font(.subheadline)
                .padding(.bottom, 5)
                .padding(.top, 5)
                .offset(x: -100, y: 400)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
