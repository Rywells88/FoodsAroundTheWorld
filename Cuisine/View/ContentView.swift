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
                .gesture(TapGesture()
                            .onEnded{_ in
                                withAnimation(.spring()){
                                    
                                    self.departButton.toggle()
                                    
                                }
                            }
                        )
                
                
            VStack(alignment: .center) {
                Text("Cuisine's Around the World")
                    .font(.title)
                    .padding(.top, 10)
        

                Text("Tap Anywhere to Start")
                    .font(.subheadline)
                    .padding(.top, 5)

                Spacer()
                
                if departButton {
                    DailyCuisine(meal: ModelData().meals[0])
                        .transition(.moveAndFade)
                        .frame(width: 400, height: 700, alignment: .center)
                        .background(Color.white).opacity(0.9)
                        .padding(.bottom, 30)

                   
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
            .environmentObject(ModelData())
    }
}
