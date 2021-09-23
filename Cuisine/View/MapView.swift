//
//  MapView.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinates : CLLocationCoordinate2D
        
    @State private var region = MKCoordinateRegion()
    
    
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                print(coordinates)
                setRegion(coordinates)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
           region = MKCoordinateRegion(
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: 4.5, longitudeDelta: 4.5)
           )
       }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: ModelData().meals[0].locationCoordinate)
    }
}
