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
    
    var day: Int = 0
    
    func updateUI() {
        
    }

}
