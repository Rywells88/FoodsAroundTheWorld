//
//  MapDate.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-06-07.
//

import SwiftUI

struct MapDate: View {
    
    @StateObject var mapData = MapViewModel()
    
    var meal : Meal
    
    var body: some View {
//        MapView(coordinates: meal.locationCoordinate)
//            .frame(width: 400, height:220, alignment: .center)
//            .overlay(TextOverlay(meal: meal))
        TestMap(coordinates: meal.locationCoordinate)
            .frame(width: UIScreen.main.bounds.width * 0.92, height:UIScreen.main.bounds.height * 0.25, alignment: .center)
            .overlay(TextOverlay(meal: meal),alignment: .topLeading)
            .environmentObject(mapData)
        
    }
}

struct TextOverlay: View {
    
    @State private var fade = false
    
    static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
    
    func convertDate(occasionDate : String)-> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        
        let date = Date()
        
        let f = formatter.string(from: date)
//                in date format
        _ = formatter.date(from: f)
//        get the year
        let year = f.components(separatedBy: " ")[2]
        
        return (formatter.date(from: occasionDate + " " + year)!)
        
    }
    
    
    var meal: Meal
    
    let formatter = DateFormatter()
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(meal.occasion)
                    .font(.title)
                    .bold()
                    .minimumScaleFactor(0.01)
        
                Text(meal.country)
                    .italic()
                    .minimumScaleFactor(0.01)
                
                Text(convertDate(occasionDate: meal.id), formatter: Self.taskDateFormat)
                    .minimumScaleFactor(0.01)
            }
            .padding(5)
            .foregroundColor(.white)
    }
}


struct MapDate_Previews: PreviewProvider {
    static var previews: some View {
        MapDate(meal: ModelData().meals[0])
    }
}
