//
//  DailyCuisine.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct DailyCuisine: View {
    
    static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
    
    let dueDate = Date()

    var body: some View {
        VStack {
			MapView()
				.frame(height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			
            Text(dueDate, formatter: Self.taskDateFormat)
                .font(.system(size: 48, weight: .heavy, design: .serif))
				.frame(width: 250, height: 120)
                .lineLimit(2)
				.foregroundColor(.black)
				.offset(x: -110,y: -160)
            

                VStack{
					
					Divider()
						.padding(10)
					
                    Text("Germany")
                        .multilineTextAlignment(.leading)
                        
                        .frame(width: 150.0)
                       
                        .font(.system(size: 16, weight: .medium, design: .serif))
						.foregroundColor(.black)
                    
                    Text("German Independence Day")
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading], 0.0)
    
                        .font(.system(size: 18, weight: .light, design: .serif))
						.foregroundColor(.black)
       
                    
        
                    Text("The cuisine of Germany (German: deutsche Küche) is made up of many different local or regional cuisines, reflecting the country's federal history. Germany itself is part of a larger cultural region, Central Europe, sharing many traditions with neighbouring countries such as Poland and the Czech Republic.")
                        .font(.system(size: 14, weight: .light, design: .serif))
						.foregroundColor(.black)
						.lineLimit(6)
						.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
						.frame(height: 150)


                }
				.offset(y:-140)

			
			
			
		MealList()
		
			.offset(y: -150)
			.frame(height: 290)

        }
        

    }
}

struct DailyCuisine_Previews: PreviewProvider {
    static var previews: some View {
        DailyCuisine()
    }
}
