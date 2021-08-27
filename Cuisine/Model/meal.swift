//
//  meal.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Meal: Hashable, Codable, Identifiable {
    var id: String
    var occasion: String
    var country: String
    var description: String
//    read value assocaited with the key by creating a new property with the same name as the key (beacuse it conforms to codable)
    var URL : String
    
    
    var mealDetails : Details

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
    }
    
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double

    }
    struct BLD : Hashable, Codable{
        var recipeName: String
        private var imageName: String
        var image : Image{
            Image(imageName)
        }
        
        var id : Int
        var ingredients : [String]
        var instructions : [String]
        var recipeURL : String
        
        
    }
    struct Details : Hashable, Codable{
        var Breakfast : BLD
        var Lunch : BLD
        var Dinner : BLD
    }
}
