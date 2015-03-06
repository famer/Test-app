//
//  City.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Location {
    
    var title: String = ""
    var currentWeather: Weather?
    var weeklyWeather: [Weather] = [Weather]()
    
    init () {}
    
    init(title: String) {
        self.title = title
    }
    
}
