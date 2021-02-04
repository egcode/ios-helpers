//
//  WeatherVC.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class WeatherVC: UIViewController {

    var _weatherDays = [WeatherDay]()
    var weatherDays: [WeatherDay] {
        return _weatherDays.reversed()
    }
    var isGetting = false
    let locationManager = CLLocationManager()
    let defaultAccuracy: CLLocationAccuracy = kCLLocationAccuracyThreeKilometers
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Side scroll to see more days"
        self.navigationController?.navigationBar.bottomBorderColor = Color.navigationBarBorder
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        self.setupLocationManager()
    
    }
    
    @IBAction func onMapButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mapSegue", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getLocationAction()
    }
    
    func getWholeWeekWeather(lattitude: Double, longtitude: Double) {
        if isGetting {   return  }
        isGetting = true
        self.setupMap(lattitude: lattitude, longtitude: longtitude)
        for i in 0..<7 {
            if let dateToFetch = DateHelpers.daysBackFromNow(days: i) {
                self.getWeatherForDate(date: dateToFetch, lattitude: lattitude, longtitude: longtitude)
            } else {
                self.alert("Could not get date \(i) days ago")
            }
        }
    }

    func getWeatherForDate(date: Date, lattitude: Double, longtitude: Double) {
        GCD.mainThread {
            self.showSpinner(message: "Downloading weather")
        }
        let timestamp = DateHelpers.timestampFromDate(date: date)
        let url = getAPIUrl(key: KEY, lattitude: lattitude, longtitude: longtitude, timestamp: timestamp)
        let weatherOp = WeatherOperation(url: url, completion: { [weak self] (weatherDay) in
            GCD.mainThread {
                self?._weatherDays.append(weatherDay)
                    self?.collectionView.reloadData()
                if OperationsManager.sharedOM.weatherQueue.operations.count == 0 {
                    self?._weatherDays.sort(by: { $0.timestamp > $1.timestamp})
                    self?.scrollToTop(animated: true)
                    self?.hideSpinner()
                    self?.isGetting = false
                }
            }
        })
        OperationsManager.sharedOM.weatherQueue.addOperation(weatherOp)
    }

    func scrollToTop(animated: Bool) {
        let m = max(self.weatherDays.count-1, 0)
        self.collectionView?.scrollToItem(at: IndexPath(row: m, section: 0),
                                          at: .left,
                                          animated: animated)
    }
    
}

