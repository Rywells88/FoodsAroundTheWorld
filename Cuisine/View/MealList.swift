//
//  MealList.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-26.
//
//
//import SwiftUI
//
//struct MealList: View {
//
//    @EnvironmentObject var modelData: ModelData
//
//    var body: some View {
//
//        NavigationView {
//            List(ModelData().meals){ meal in
//                NavigationLink(
//                    destination: mealDetail(showBreakfast: .constant(false), m: meal, mDetail: <#T##MealDetail#>),
//                    label: {
//                        Text(meal.meal)
//                    })
//
//            }
//            .navigationTitle("Select a Meal")
//            .listStyle(InsetGroupedListStyle())
//
//        }
//        .background(Color.white.opacity(0.1))
//
//    }
//
//}
//
//struct MealList_Previews: PreviewProvider {
//    static var previews: some View {
//        MealList()
//            .environmentObject(ModelData())
//    }
//}
