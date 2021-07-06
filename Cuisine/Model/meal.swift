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
    var id: Int
    var occasion: String
    var meal: String
    var recipeName: String
    var country: String
    var description: String
    var isFavorite: Bool
//    read value assocaited with the key by creating a new property with the same name as the key (beacuse it conforms to codable)
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
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
}
