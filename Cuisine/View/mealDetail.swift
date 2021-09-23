//
//  mealDetail.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

//struct mealDetail: View {
//    @Binding var activeSheet : ActiveSheet?
//
////    @EnvironmentObject var modelData: ModelData
////
////    static var meals = ModelData().details
//
//    var m : Meal.BLD
//
//    var body: some View {
//
//
//        NavigationView{
//
//            ZStack{
//                Color.black.opacity(0.4)
//                    .ignoresSafeArea()
//                VStack {
//
//                    HStack(alignment: .center){
//                        m.image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 200, height: 150)
//                            .cornerRadius(10)
//                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 1))
//                            .shadow(radius:10)
//
//
//
//
//                    }
//                    .padding(.bottom, 50)
//
//
//                    HStack{
//
//
//                        let ing = m.ingredients
//
//                            List(ing, id: \.self){ ingredient in
//                                Label(ingredient, systemImage: "circle.fill")
//
//                            }
//                            .frame(width: 200, height: 400)
//
//
//
//
//
//
//                        VStack {
//
//                            let ins = m.instructions
//
//                            ForEach(Array(zip(ins.indices, ins)), id: \.0) { index, item in
//                                Label(item, systemImage: String(index+1)+".circle")
//                                    .padding(1)
//
//                            }
//
//
//                        }
//                        .frame(width: 200, height: 400)
//                        .ignoresSafeArea()
//                        .background(Color.white.opacity(0.5))
//
//
//                    }
//                    .padding(5)
//                }
//            }
//
//            .navigationBarItems(trailing: Button("Done", action: {self.activeSheet = nil}))
//          .navigationBarTitle(m.recipeName, displayMode: .inline)
//
//        }
//
//
//
//
//    }
//
//}
//
//
//struct mealDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        mealDetail(activeSheet: .constant(.lunch), m: ModelData().meals[0].mealDetails.Lunch)
//    }
//}
//
