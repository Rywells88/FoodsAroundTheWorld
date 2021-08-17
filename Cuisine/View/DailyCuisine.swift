//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

enum ActiveSheet: Identifiable {
	case breakfast, lunch, dinner
	
	var id: Int {
		hashValue
	}
}


struct DailyCuisine: View {
	
//	@EnvironmentObject var modelData: ModelData
	
	@State private var activeSheet : ActiveSheet?
	
	var meal: Meal
	
	
//	static var meals = ModelData().meals


    var body: some View {

        VStack {
			
			MapDate(meal:meal)
				.frame(width: 250, height: 150, alignment: .center)
				.padding(.bottom, 75)
				.padding(.top, 1)
			
            

			Divider()
				.padding(10)
                    
        
			Text(meal.description)
				.font(.system(size: 14, weight: .light, design: .serif))
				.foregroundColor(.black)
				.lineLimit(6)
				.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
				.frame(height: 150)
			
			Spacer()
				.frame(minHeight: 15, idealHeight: 25, maxHeight: 30)

			HStack (alignment: .center, spacing: 20){
				VStack {
					Button(action: {activeSheet = .breakfast}){
						meal.mealDetails.Breakfast.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Breakfast")
							.aspectRatio(0.5, contentMode: .fill)
					}
					Text("Breakfast")
						.foregroundColor(.black)
				}
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .lunch}){
						meal.mealDetails.Lunch.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Lunch")
							.aspectRatio(0.5, contentMode: .fill)
					}
					Text("Lunch")
						.foregroundColor(.black)
				}
			.padding(.trailing, 10)
			.padding(.leading, 2)
				VStack {
					Button(action: {activeSheet = .dinner}){
						meal.mealDetails.Dinner.image
							.resizable()
							.clipShape(	Circle())
							.frame(width: 110, height: 110, alignment: .leading)
							.tag("Dinner")
							.aspectRatio(1, contentMode: .fill)
					}
					Text("Dinner")
						.foregroundColor(.black)
				}
				.padding(.trailing, 10)
				.padding(.leading, 2)
		
			}


			
		}
			.padding(.bottom, 40)
		.sheet(item: $activeSheet){item in
			switch item {
			case .breakfast:
				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Breakfast)
			case .lunch:
				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Lunch)
			case .dinner:
				mealDetail(activeSheet: self.$activeSheet, m: meal.mealDetails.Dinner)
			}
		}
		
		
		
}
}

struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
		DailyCuisine(meal: ModelData().meals[1])
			.environmentObject(ModelData())
			.previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
