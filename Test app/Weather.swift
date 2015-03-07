//
//  Weather.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Weather {
    
    let FahrenheitZero: Float = 273.0
    
    var temperature: Float = 0.0
    var temperatureCelsius: Float {
        return temperature
    }
    var temperatureFahrenheit: Float {
        return temperature + FahrenheitZero
    }
    
    var humidity: Int = 0
    
    var precipitiation: Float = 0.0
    
    var pressureMB: Int = 0
    
    var windSpeed: Int = 0
    
    enum WindDirection: Int {
        case N, NE, E, SE, S, SW, W, NW
        func description() -> String {
            switch self {
            case .N:
                return "N"
            default:
                return ""
            }
        }
        
        
    }
    
    var windDirection: WindDirection = WindDirection.N
    
    enum Cloudness {
        case Sunny, Windy, RainShowers, Lightning, Cloudy, Foggy
        
        func description() -> String {
            switch self {
            case .RainShowers:
                return "Rain Showers"
            default:
                return ""
            }
        }
    }
    
    var cloudness: Cloudness = Cloudness.Cloudy
    
    var date: NSDate = NSDate()
    
    init(temperature: Float) {
        self.temperature = temperature
    }
    
    init(temperature: Float, humidity: Int, precipitiation: Float, pressureMB: Int, windSpeed: Int, windDirection: WindDirection, date: NSDate) {
        self.temperature = temperature
        self.humidity = humidity
        self.precipitiation = precipitiation
        self.pressureMB = pressureMB
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.date = date
    }

}