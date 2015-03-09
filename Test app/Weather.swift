//
//  Weather.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Weather {
    
    let FahrenheitCoefficient: Float = 1.8
    let FahrenheitShift: Int = 32
    let MilesRatio: Float = 0.621371192
    
    var temperature: Int = 0
    var temperatureCelsius: Int {
        return temperature
    }
    var temperatureFahrenheit: Int {
        //let t = Float(temperature) * FahrenheitCoefficient + Float(FahrenheitShift)
        return Int(Float(temperature) * FahrenheitCoefficient + Float(FahrenheitShift))
    }
    
    var humidity: Int = 0
    
    var precipitiation: Float = 0.0
    
    var pressureMB: Int = 0
    
    var windSpeed: Int = 0
    
    var windSpeedKilometers: Int {
        return windSpeed
    }
    
    var windSpeedFeets: Int {
        return Int(Float(windSpeed) * MilesRatio)
    }
    
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
    
    var weekday: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.stringFromDate(date)
    }
    
    
    func getTemperature(temperatureSetting: Settings.TemperatureMeasurement) -> Int{
        switch temperatureSetting {
        case .Celsius:
            return temperatureCelsius
        case .Fahrenheit:
            return temperatureFahrenheit
        }
    }
    
    func getWindSpeed(lengthSetting: Settings.LengthMeasurement) -> Int {
        switch lengthSetting {
        case .Meters:
            return windSpeedKilometers
        case .Feets:
            return windSpeedFeets
        }
    }
    
    init(temperature: Int) {
        self.temperature = temperature
    }
    
    init(temperature: Int, humidity: Int, precipitiation: Float, pressureMB: Int, windSpeed: Int, windDirection: WindDirection, cloudness: Cloudness, date: NSDate) {
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