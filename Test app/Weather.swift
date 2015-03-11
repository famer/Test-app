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
        
        init(fromDegree: Int) {
            switch fromDegree {
            case 0...45:
                self = .N
            case 46...90:
                self = .NE
            case 91...135:
                self = .E
            case 136...180:
                self = .SE
            case 181...225:
                self = .S
            case 226...270:
                self = .SW
            case 271...315:
                self = .W
            case 316...360:
                self = .NW
            default:
                self = .N
            }
            
        }
        
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
        
        init(fromString: String) {
            switch fromString {
            case "Clear":
                self = .Sunny
            default:
                self = .Sunny
            }
        }
        
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
    
    init() {}
    
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
    
    func fetch(data: AnyObject, handler: (() -> ())?) {
        //self.temperature = ((data.valueForKey("FeelsLikeC") as NSArray!)[0] as String)
        
        if let value = data.valueForKey("temp_C") as? NSArray {
            self.temperature = (value[0] as String).toInt()!
        }
        
        if let value = data.valueForKey("humidity") as? NSArray {
            self.humidity = (value[0] as String).toInt()!
        }
        
        if let value = data.valueForKey("precipMM") as? NSArray {
            self.precipitiation = (value[0] as NSString).floatValue
        }
        
        if let value = data.valueForKey("pressure") as? NSArray {
            self.pressureMB = (value[0] as String).toInt()!
        }
        
        if let value = data.valueForKey("windspeedKmph") as? NSArray {
            self.windSpeed = (value[0] as String).toInt()!
        }
        if let value = data.valueForKey("weatherDesc") as? NSArray {
            var weatherDescription = value[0][0].valueForKey("value")! as String
            self.cloudness = Cloudness(fromString: weatherDescription)
        }
        
        
        if let value = data.valueForKey("winddirDegree") as? NSArray {
            self.windDirection = Weather.WindDirection(fromDegree: (value[0] as String).toInt()!)
        }
        
        
    }
    
    func fetchWeekly(data: AnyObject, handler: (() -> ())?) {
        if let value = data.valueForKey("date") as? String {
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            self.date = dateFormatter.dateFromString(value)!
        }
        
        if let hourly = data.valueForKey("hourly") as? NSArray {
            
            if hourly.count != 0 {
                var values = hourly[0]
                if let _temperature = values.valueForKey("tempC") as String! {
                    self.temperature = _temperature.toInt()!
                }
                
                if let value = values.valueForKey("weatherDesc") as? NSArray {
                    var weatherDescription = value[0].valueForKey("value")! as String
                    self.cloudness = Cloudness(fromString: weatherDescription)
                }
            }
            
        }
        //winddirDegree
        //windspeedKmph
        if let _handler = handler {
            _handler()
        }

    }
    

}