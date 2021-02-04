//
//  WeatherVC+Location.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import CoreLocation

extension WeatherVC: CLLocationManagerDelegate {
    
    func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = self.defaultAccuracy
        }
    }
    
    public func getLocationAction() {
        self.showSpinner(message: "Getting Location")
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        } else {
            if self._weatherDays.isEmpty {
                self.alertInput(message: "No Location Permission.\nGetting weather using default Irvine location") {
                    self.getWholeWeekWeather(lattitude: defaultLattitude, longtitude: defaultLongtitude)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.hideSpinner()
        if let location = locations.first {
            self.getWholeWeekWeather(lattitude: location.coordinate.latitude, longtitude: location.coordinate.longitude)
        } else {
            self.getWholeWeekWeather(lattitude: defaultLattitude, longtitude: defaultLongtitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.hideSpinner()
        if self._weatherDays.isEmpty {
            self.alertInput(message: "Unable to get Location.\nGetting weather using default Irvine location") {
                self.getWholeWeekWeather(lattitude: defaultLattitude, longtitude: defaultLongtitude)
            }
        }
    }
    
}





