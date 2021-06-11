//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct DailyCuisine: View {
	
	@EnvironmentObject var modelData: ModelData
	
	@State private var showBreakfast = false
	@State private var showLunch = false
	@State private var showDinner = false
	
	var meal: Meal
	
	static var meals = ModelData().meals


    var body: some View {

        VStack {
			
			MapDate(meal:meal)
			
            

			Divider()
				.padding(10)
                    
        
			Text(meal.description)
				.font(.system(size: 14, weight: .light, design: .serif))
				.foregroundColor(.black)
				.lineLimit(6)
				.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
				.frame(height: 150)
			
			Spacer()
				.frame(height: 60)

			HStack (alignment: .center, spacing: 20){
				VStack {
					Button(action: {self.showBreakfast.toggle()}){
						ModelData().meals[0].image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Breakfast")
					}
					Text("Breakfast")
				}
				VStack {
					Button(action: {self.showLunch.toggle()}){
						ModelData().meals[1].image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Lunch")
					}
					Text("Lunch")
				}
				VStack {
					Button(action: {self.showDinner.toggle()}){
						ModelData().meals[2].image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Dinner")
					}
					Text("Dinner")
				}
			}
			
//			List(ModelData().meals){ meal in
//				NavigationLink(
//					destination: mealDetail(m: meal)
//						.ignoresSafeArea(.all)
//						.frame(width: 400, height: 900, alignment: .center),
//					label: {
//						Text(meal.meal)
//					})
//
//			}
//			.listStyle(InsetGroupedListStyle())
//			.background(Color.blue)
//			.navigationTitle("Select a Meal")
			Spacer()
				.frame(height: 100)
		}
		.sheet(isPresented: $showBreakfast, content: {
			mealDetail(showBreakfast: self.$showBreakfast, m: DailyCuisine.meals[0])
		})
		.sheet(isPresented: $showLunch, content: {
			mealDetail(showBreakfast: self.$showLunch, m: DailyCuisine.meals[1])
		})
		.sheet(isPresented: $showDinner, content: {
			mealDetail(showBreakfast: self.$showDinner, m: DailyCuisine.meals[2])
		})
		
		
}
}

struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
		DailyCuisine(meal: ModelData().meals[1])
			.environmentObject(ModelData())
    }
}
