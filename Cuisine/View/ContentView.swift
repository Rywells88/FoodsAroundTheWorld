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
    @State private var infoButton = false
    
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
                    .padding(.top, 5)
                    .foregroundColor(.black).opacity(0.8)
                    .shadow(radius: 1)
        

                Text("Tap Anywhere to Start")
                    .font(.subheadline)
                    .padding(.top, 70)
                    .foregroundColor(.black).opacity(0.8)
                    .shadow(radius: 1)
                    .onAppear{
                        
                    }

                    

                Spacer()
                if departButton {

                    DailyCuisine(WikiResult: "",WikiURL: URL(string: "https://github.com/Raureif/WikipediaKit")!, meal: today.getOccasion())
                        .padding(.top, 5)
                        .background(Color.white).opacity(0.9)
                        .padding(.bottom, 3)

        
                

                   
                }
                
                HStack{
                    Button("About"){
                        infoButton.toggle()
                    }
                    .fullScreenCover(isPresented: $infoButton, content: {
                        AboutMe()
                    })
                    .padding(10)
                    Spacer()
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
