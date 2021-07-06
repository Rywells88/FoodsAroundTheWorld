//
//  mealDetail.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-06-26.
//

import Foundation
import SwiftUI

struct MealDetail : Hashable, Codable, Identifiable{
   
    var id: Int
    
    var meal : String
    
    var ingredients : [String]
    
    var instructions : [String]
    
}
