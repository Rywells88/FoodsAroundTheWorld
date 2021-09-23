//
//  AirplaneWindow.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-09-22.
//

import Foundation
import CoreGraphics

struct AirplaneWindow{
    
    struct Segment{
        let line: CGPoint
        let curve: CGPoint
    }
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.2),
            curve:   CGPoint(x: 0.40, y: 0.2)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.8),
            curve:   CGPoint(x: 0.00, y: 0.8)
        )
    
    ]
}
