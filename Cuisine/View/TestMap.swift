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
    
    var coordinates : CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {


        // 1
        view.mapType = .mutedStandard
                
        // 2
        let pointOfInterest = CLLocationCoordinate2D(latitude: coordinates.latitude,longitude: coordinates.longitude)

        // 3
        let coordinate = CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        // 4
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
