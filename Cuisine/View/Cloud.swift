//
//  Cloud.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-09-22.
//

import SwiftUI

struct Cloud: View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(
                to: CGPoint(
                        x: width * 0.95,
                        y: height * 0.90
                )
            )
           AirplaneWindow.segments.forEach { segment in
                           path.addLine(
                               to: CGPoint(
                                   x: width * segment.line.x,
                                   y: height * segment.line.y
                               )
                           )
                       }

        }
        .fill(Color.black)
    }
}

struct Cloud_Previews: PreviewProvider {
    static var previews: some View {
        Cloud()
    }
}
