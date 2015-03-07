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
            case .NE:
                return "NE"
            case .E:
                return "E"
            case .SE:
                return "SE"
            case .S:
                return "S"
            case .SW:
                return "SW"
            case .W:
                return "W"
            case .NW:
                return "NW"
            }
        }
        
        
    }
    
    var windDirection: WindDirection = WindDirection.N
    
    enum Cloudness {
        case Sunny, Windy, RainShowers, Lightning, Cloudy
        
        func description() -> String {
            switch self {
            case .Sunny:
                return "Sunny"
            case .Windy:
                return "Windy"
            case .RainShowers:
                return "Rain Showers"
            case .Lightning:
                return "Lightning"
            case .Cloudy:
                return "Cloudy"
            }
        }
        
        func imageName() -> String {
            switch self {
            case .Sunny:
                return "Sun_Big"
            case .Windy:
                return "WInd_Big"
            case .RainShowers:
                return "Rain Showers"
            case .Lightning:
                return "Lightning_Big"
            case .Cloudy:
                return "Cloudy_Big"
            }
        }
    }
    
    var cloudness: Cloudness = Cloudness.Cloudy
    
    var date: NSDate = NSDate()
    
    init(temperature: Float) {
        self.temperature = temperature
    }
    
    init(temperature: Float, humidity: Int, precipitiation: Float, pressureMB: Int, windSpeed: Int, windDirection: WindDirection, cloudness: Cloudness, date: NSDate) {
        self.temperature = temperature
        self.humidity = humidity
        self.precipitiation = precipitiation
        self.pressureMB = pressureMB
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.cloudness = cloudness
        self.date = date
    }

}