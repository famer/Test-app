//
//  LocationTableViewCell.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    var location: Location = Location() {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var currentLocationSign: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var cellTemperature: UILabel!
    
    func updateUI() {
        let tempertureMeasure = Settings.TemperatureMeasurement(rawValue: Settings.getOptionValue("Units of temperature"))!
        
        cellTitle.text = location.title
        currentLocationSign.hidden = !location.currentGeoLocation
        
        if let currentWeather = location.currentWeather {
            weatherImage.image = UIImage(named: currentWeather.cloudness.imageName())
            self.cellSubtitle.text = currentWeather.cloudness.description()
            self.cellTemperature.text = "\(currentWeather.getTemperature(tempertureMeasure))°"
        }
        

    }
    
    
    
    

}
