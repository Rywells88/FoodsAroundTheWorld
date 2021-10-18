//
//  MapDate.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-06-07.
//

import SwiftUI

struct MapDate: View {
    
    var meal : Meal
    
    var body: some View {
        MapView(coordinates: meal.locationCoordinate)
            .frame(width: 400, height:220, alignment: .center)
            .overlay(TextOverlay(meal: meal))
    }
}

struct TextOverlay: View {
    
    static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
    
    func convertDate(occasionDate : String)-> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        
        let date = Date()
        
        var f = formatter.string(from: date)
//                in date format
        let todayDate = formatter.date(from: f)
//        get the year
        var year = f.components(separatedBy: " ")[2]
        
        return (formatter.date(from: occasionDate + " " + year)!)
        
    }
    
    
    var meal: Meal
    
    
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    let formatter = DateFormatter()
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(meal.occasion)
                    .font(.title)
                    .bold()
                Text(meal.country)
                
                Text(convertDate(occasionDate: meal.id), formatter: Self.taskDateFormat)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct MapDate_Previews: PreviewProvider {
    static var previews: some View {
        MapDate(meal: ModelData().meals[0])
    }
}
