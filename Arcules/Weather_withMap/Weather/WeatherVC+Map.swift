//
//  WeatherVC+Map.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/23/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit
import MapKit

extension WeatherVC {
    
    func setupMap(lattitude: Double, longtitude: Double) {
        
        self.map.mapType = MKMapType.standard
        let location = CLLocationCoordinate2D(latitude: lattitude,longitude: longtitude)
//        let location = CLLocationCoordinate2D(latitude: defaultLattitude,longitude: defaultLongtitude)

        let span = MKCoordinateSpanMake(1.15, 1.15)
        let region = MKCoordinateRegion(center: location, span: span)
        self.map.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "You are here"
        annotation.subtitle = "we take weather from this location"
        self.map.addAnnotation(annotation)
    }

}
