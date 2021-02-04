//
//  WeatherCell.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelWindspeed: UILabel!
    @IBOutlet weak var labelVisibility: UILabel!
    
    override func awakeFromNib() {
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 20
        
        //Shadow
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 18
        imageView.layer.shadowOpacity = 0.7
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        labelTemperature.layer.shadowColor = imageView.layer.shadowColor
        labelTemperature.layer.shadowRadius = imageView.layer.shadowRadius
        labelTemperature.layer.shadowOpacity = imageView.layer.shadowOpacity
        labelTemperature.layer.shadowOffset = imageView.layer.shadowOffset
        
        labelSummary.layer.shadowColor = imageView.layer.shadowColor
        labelSummary.layer.shadowRadius = imageView.layer.shadowRadius
        labelSummary.layer.shadowOpacity = imageView.layer.shadowOpacity
        labelSummary.layer.shadowOffset = imageView.layer.shadowOffset
    }
    
    func configureCell(weatherDay:WeatherDay) {
        self.labelDate.text = weatherDay.dateString
        let t = Int((weatherDay.temperatureMin + weatherDay.temperatureMax)/2)
        self.labelTemperature.text = "\(t)°"
        self.labelSummary.text = weatherDay.summary
        if weatherDay.iconName != "" {
            self.imageView.image = UIImage(named: weatherDay.iconName)
        }
        let h = Int(weatherDay.humidity * 100)
        self.labelHumidity.text = "\(h) %"
        self.labelPressure.text = "\(Int(weatherDay.pressure)) mb"
        self.labelWindspeed.text = "\(weatherDay.windspeed) mph"
        self.labelVisibility.text = "\(weatherDay.visibility) m"
    }
    
}


