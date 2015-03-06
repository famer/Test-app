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
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var cellTemperature: UILabel!
    
    func updateUI() {
        weatherImage.image = UIImage(named: "CL")//location.currentWeather.
        
        if let currentWeather = location.currentWeather {
            self.cellSubtitle.text = String(currentWeather.windDirection.rawValue)
            self.cellTemperature.text = "\(currentWeather.temperature)"
        }
        

    }
    
    

}
