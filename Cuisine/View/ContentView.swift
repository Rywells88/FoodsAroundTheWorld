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
    let today = TodaysOccasion()
        

            
        
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
                    .padding(.top, 80)
                    .foregroundColor(.white).opacity(0.8)
        

                Text("Tap Anywhere to Start")
                    .font(.subheadline)
                    .padding(.top, 5)
                    .foregroundColor(.white).opacity(0.8)

                Spacer()
                if departButton {

                    DailyCuisine(WikiResult: "", meal: today.getOccasion())
//                        .transition(.moveAndFade)
                        .padding(.top, 5)
                        .background(Color.white).opacity(0.9)
                        .padding(.bottom, 50)

        
                

                   
                }
                
                
                   
            }

            }
        
            
            
            
        }
        
        
        
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
