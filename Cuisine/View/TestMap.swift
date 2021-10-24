//
//  TestMap.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-10-20.
//

import SwiftUI
import MapKit

struct TestMap: UIViewRepresentable {
    
    @State private var region = MKCoordinateRegion()
    
    @EnvironmentObject var mapData : MapViewModel
    

    var coordinates : CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        
        view.mapType = .mutedStandard
        
        view.showsUserLocation = false
       
        
        return view

    }

    func updateUIView(_ view: MKMapView, context: Context) {


        view.mapType = .mutedStandard
        view.mask?.backgroundColor = .darkGray
       
        
        let pointOfInterest = CLLocationCoordinate2D(latitude: coordinates.latitude,longitude: coordinates.longitude)

 
        let coordinate = CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

  
        let annotation = MKPointAnnotation()
        annotation.coordinate = pointOfInterest

        view.addAnnotation(annotation)
    }
}

struct TestMap_Previews: PreviewProvider {
    static var previews: some View {
        TestMap(coordinates: ModelData().meals[0].locationCoordinate)
    }
}
