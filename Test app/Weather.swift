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
    /*
    enum temperaturet {
        case Celsius(Float)
        case Fahrenheit(Float)
    }*/
    
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
    }
    
    var windDirection: WindDirection = WindDirection.N
    
    enum cloud {
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
    /*
    enum cloudness: String {
        case Sunny = "Sunny"
        
    }*/
    
    var date: NSDate = NSDate()
    
    init(temperature: Float) {
        self.temperature = temperature
    }

}