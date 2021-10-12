//
//  TodaySelector.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-07-28.
//

import Foundation

class TodaysOccasion{
    
    static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
    
    func getOccasion()-> Meal{
//        return the occasion that corresponds to today. if one doesn't exist, find the closest one and return that
        
        var meals = ModelData().meals
        
        var today = getDate()
        
        var closest = 100000.0
        
        var closestMeal : Meal = meals[0]
        
        for meal in meals {
            if (meal.id == today){
                return (meal)
            }
            else{
                // calculate how close this date is to today
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM d yyyy"
                
                
                let date = Date()

                var f = formatter.string(from: date)
//                in date format
                let todayDate = formatter.date(from: f)
                
                var year = f.components(separatedBy: " ")[2]
             
                let lhs = formatter.date(from: meal.id + " " + year)
               
                
                var tmp = Double(abs((lhs?.timeIntervalSince(todayDate!))!)) * 0.001
                
                
                if (tmp < closest){
                    closest = tmp
                    
                    closestMeal = meal
                }
                
                
                
            }
            
        }
        
        return (closestMeal)
       
        
    }
    
    private func getDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        
        let date = Date()
        return (formatter.string(from: date))
        
        
        
    }
    
    
}






// get today's date

// pick appropriate day from
