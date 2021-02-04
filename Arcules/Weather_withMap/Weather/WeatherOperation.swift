//
//  WeatherOperation.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

class WeatherOperation: AsyncOperation {
    
    let defaultSession = URLSession(configuration: .default)
    var task: URLSessionDataTask?
    private let completion: ((_ weatherDay:WeatherDay) -> ())?
    let url: String
    
    init(url:String, completion: ((_ weatherDay:WeatherDay) -> ())?) {
        self.completion = completion
        self.url = url
        super.init()
    }
    
    override func main() {
        
        APIManager.get(url: url) { [weak self] (code, object) in
            guard (code == 200) else {
                print("Request Error")
                self?.finishedRequest(success: false, weatherDay: nil)
                return
            }
            guard let data = object as? [String:AnyObject] else {
                print("Data Error")
                self?.finishedRequest(success: false, weatherDay: nil)
                return
            }
            guard let daily = data["daily"] as? [String:AnyObject] else {
                print("Daily Data Error")
                self?.finishedRequest(success: false, weatherDay: nil)
                return
            }
            guard let dayWeather = daily["data"] as? [[String:AnyObject]], let dayData = dayWeather.first else {
                print("DaysArray Data Error")
                self?.finishedRequest(success: false, weatherDay: nil)
                return
            }
            let weatherDay = WeatherDay(data: dayData)
            self?.finishedRequest(success: true, weatherDay: weatherDay)
        }
    }
    
    fileprivate func finishedRequest(success:Bool, weatherDay: WeatherDay?) {
        self.state = .finished
        if success {
            if let complete = self.completion, let wd = weatherDay { complete(wd) }
        } else {
            print("---NO Success to Geting weather ")

        }
    }
}
