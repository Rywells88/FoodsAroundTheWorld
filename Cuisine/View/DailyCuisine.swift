//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct DailyCuisine: View {
	
	@EnvironmentObject var modelData: ModelData
	
	var meal: Meal
	


    var body: some View {
        VStack {
			
			MapDate(meal:meal)
			
            

                VStack{
					
					Divider()
						.padding(10)
                    
        
					Text(meal.description)
                        .font(.system(size: 14, weight: .light, design: .serif))
						.foregroundColor(.black)
						.lineLimit(6)
						.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
						.frame(height: 150)


                }
			

			
			
			
		MealList()
			.frame(height: 290)
        }
}
}

struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
		DailyCuisine(meal: ModelData().meals[0])
			.environmentObject(ModelData())
    }
}
