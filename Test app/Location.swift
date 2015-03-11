//
//  City.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Location {
    
    let manager = AFHTTPRequestOperationManager()
    let apiBaseUrl = "http://api.worldweatheronline.com/free/v2/weather.ashx"
    let apiKey = "09b47d895739b0834ed22521bbd5e"
    let apiFullUrl = "http://api.worldweatheronline.com/free/v2/weather.ashx?num_of_days=5&key=09b47d895739b0834ed22521bbd5e&tp=24&format=json&q="
    
    
    var title: String = ""
    
    var fullTitle: String {
        return title
    }
    var currentWeather: Weather = Weather()
    var weeklyWeather: [Weather] = [Weather]()
    var locationHelper = LocationHelper.sharedInstance
    var currentGeoLocation: Bool {
        return locationHelper.locality.lowercaseString.rangeOfString(self.title.lowercaseString) != nil
    }
    
    init () {}
    
    init(title: String) {
        self.title = title
    }
    
    func load(handler: (() -> ())?) {
        
        //print(title.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()))
       
        manager.GET( "\(apiFullUrl)\(title.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!)",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                //print(responseObject)
                
                
                if let data: AnyObject = responseObject["data"]! {
                    if let current_condition: AnyObject = data["current_condition"]! {
                        self.currentWeather.fetch(responseObject.valueForKeyPath("data.current_condition")!, handler)
                        if let arr = responseObject.valueForKeyPath("data.weather") as? NSArray {
                            self.weeklyWeather = []
                            for elem in arr {
                                var weather: Weather = Weather()
                                weather.fetchWeekly(elem, handler: handler)
                                self.weeklyWeather.append(weather)
                            }
                        }
                    }
                }
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
    }
    
    func currentWeatherLoaded(json: String) {
        var data = json.dataUsingEncoding(NSUTF8StringEncoding)!
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        

    }
    
    func loadForecast() {
        
    }
    
    func finishedLoading(response: AnyObject) {
        
        //self.currentWeather = response.weather
        
    }
    
}
