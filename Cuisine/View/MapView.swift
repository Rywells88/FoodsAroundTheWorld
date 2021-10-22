//
//  MapView.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MapView: View {
    
    var coordinates : CLLocationCoordinate2D
        
    @State private var region = MKCoordinateRegion()
    
  
    
   
    
    
    
    
    var body: some View {
       
        Map(coordinateRegion: $region)
        .onAppear{
            setRegion(coordinates)
            
           
        }

        
        

    }
    
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
           region = MKCoordinateRegion(
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
           )
       }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: ModelData().meals[0].locationCoordinate)
    }
}
