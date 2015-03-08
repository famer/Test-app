//
//  WeatherTableViewCell.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var weather: Weather = Weather(temperature: 20) {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var cellTemperature: UILabel!
    
    var day: Int = 0
    
    func updateUI() {
        
        let tempertureMeasure = Settings.TemperatureMeasurement(rawValue: Settings.getOptionValue("Units of temperature"))!
        
        weatherImage.image = UIImage(named: weather.cloudness.imageName())
        
        cellTitle.text = "Monday"
        self.cellSubtitle.text = weather.cloudness.description()
        self.cellTemperature.text = "\(weather.getTemperature(tempertureMeasure))°"
        
    }

}
