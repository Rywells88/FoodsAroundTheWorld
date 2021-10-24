//
//  MapViewModel.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-10-23.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject{
    
    @Published var mapView = MKMapView()
    
    @Published var region : MKCoordinateRegion!
}
