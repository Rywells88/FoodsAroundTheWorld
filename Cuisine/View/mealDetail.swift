//
//  mealDetail.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct mealDetail: View {
    @Binding var showBreakfast : Bool
    
    @EnvironmentObject var modelData: ModelData
    
    static var meals = ModelData().details
    
    var mDetail: MealDetail
    var m : Meal
    
    func testFunction(){
        print(mDetail.ingredients)
        print(type(of: mDetail.ingredients))
    }
    var body: some View {
        
       
        NavigationView{

            ZStack{
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                VStack {
                    
                    HStack(alignment: .center){
                        m.image
                            .resizable()
                            .frame(width: 250, height: 300, alignment: .center)
                            .ignoresSafeArea()
                            .padding(.leading, -35)
                        Text(m.recipeName)
                            .font(.largeTitle)
                            .onAppear(){
                                self.testFunction()
                            }

                        
                    }
                    
                    
                    Spacer()
                    HStack{
                        ZStack{
                            
//                        Color.purple
                        VStack{
                            Text("Ingredients")
                            let ing = mDetail.ingredients
                            
                            List(ing, id: \.self){ ingredient in
                                Label(ingredient, systemImage: "circle.fill")

                            }

                        
                            
                            }
                        .frame(width: 180, height: 500)
                        .padding(.top, 10)
                        .padding(.bottom, 60)
                        .ignoresSafeArea()
                        }
                
                        VStack {
                            Text("Directions")
                            let ins = mDetail.instructions
                            
                            ForEach(Array(zip(ins.indices, ins)), id: \.0) { index, item in
                                Label(item, systemImage: String(index+1)+".circle")
                                    .padding(1)
                                
                            }
                            
                        }
                        .frame(width: 200, height: 450)
                        .ignoresSafeArea()
                        .background(Color.white.opacity(0.5))
                        
                            
                    }
                    Spacer()
                }
            }
                .navigationBarItems(trailing: Button("Done", action: {self.showBreakfast = false}))
                .navigationBarTitle(m.recipeName, displayMode: .inline)
            
            
        }
        
        
       
    }
    
}

struct mealDetail_Previews: PreviewProvider {
    static var previews: some View {
        mealDetail(showBreakfast: .constant(true), mDetail: ModelData().details[0], m: ModelData().meals[0])
    }
}
