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
        
        var meals = ModelData().meals
        
        var today = getDate()
        
        print("I've been called")
        for meal in meals {
            if (meal.id == today){
                print(meal.id)
                return (meal)
            }
            
        }
        
        
        return (meals[0])
//        it shouldn't do this
        
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
