//
//  Settings.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Settings {
    
    
    enum TemperatureMeasurement: Int {
        case Celsius, Fahrenheit
        
        var symbol: String {
            switch self {
            case .Celsius:
                return "℃"
            case .Fahrenheit:
                return "℉"
            }
        }
        
        func description() -> String {
            switch self {
            case .Celsius:
                return "Celsius"
            case .Fahrenheit:
                return "Fahrenheit"
            }
        }
        
        static func getValues() -> [String] {
            return ["Celsius", "Fahrenheit"]
        }
    }
    
    enum LengthMeasurement: Int {
        case Meters, Feets
        
        var symbol: String {
            switch self {
            case .Meters:
                return "km"
            case .Feets:
                return "ml"
            }
        }
        
        
        func description() -> String {
            switch self {
            case .Meters:
                return "Meters"
            case .Feets:
                return "Feets"
            }
        }
        
        static func getValues() -> [String] {
            return ["Meters", "Feets"]
        }
    }
    
    class func getOptionValue(title: String) -> Int {
        if let value = NSUserDefaults.standardUserDefaults().objectForKey(title) as? Int {
           return value
        } else {
            return 0
        }
    }
    
    class func setOptionValue(title: String, value: Int) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: title)
    }
    
    class func getSavedValue(title: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(title)
    }
    
    class func saveValue(title: String, value: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: title)
    }

}