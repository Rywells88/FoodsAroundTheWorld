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
    @State private var scalingFactor = false
    @State private var fade = false
    
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
                Text("Dream Cuisine")
                    .padding(.top, 5)
                    .foregroundColor(.black).opacity(0.8)
                    .shadow(radius: 1)
                    .font(.custom("Helvetica", size: 36))
        

                Text("Tap Anywhere to Start")
                    .font(.custom("Helvetica", size: 18))
                    .padding(.top, 70)
                    .foregroundColor(.black).opacity(0.8)
                    .shadow(radius: 1)
                    .scaleEffect()
                    .onAppear(){
                        withAnimation(Animation.easeOut(duration: 1.2).repeatForever(autoreverses: true)){
                            fade.toggle()
                        }
                    }.opacity(fade ? 0 : 1)
                    

                    

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
