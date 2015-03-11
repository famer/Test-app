//
//  Locations.swift
//  Test app
//
//  Created by Тимур Татаршаов on 10.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Locations {
    
    class var sharedInstance : Locations {
        struct Static {
            static let instance : Locations = Locations()
        }
        return Static.instance
    }
    
    var locationsString: [String] = ["Vienna", "Prague"] {
        didSet {
            for location in locationsString {
                self.addLocation(location)
            }
        }
    }
    var locations: [Location] = []
    var currentLocationString: String = "Vienna" {
        didSet {
            currentLocation = Location(title: currentLocationString)
        }
    }
    var currentLocation: Location = Location(title: "Vienna")
    
    func addLocation(title: String) {
        if !contains(locationsString, title) {
            locationsString.append(title)
            let location = Location(title: title)
            locations.append(location)
        }
        
        
    }
    
    
    func loadState() {
        
        if let _locationsString = Settings.getSavedValue("Locations List") as? [String] {
            locationsString = _locationsString
        }
        
        if let _currentLocation = Settings.getSavedValue("Current Location") as? String {
            currentLocationString = _currentLocation
        }
        
    }
    
    func saveState() {
        Settings.saveValue("Current Location", value: currentLocation.title)
        Settings.saveValue("Locations List", value: locationsString)
    }

}