//
//  Navigation.swift
//  Spotty Finder
//
//  Created by Тимур Татаршаов on 16.10.14.
//  Copyright (c) 2014 Timur Tatarshaov. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHelper {
    
    class var sharedInstance : LocationHelper {
        struct Static {
            static let instance : LocationHelper = LocationHelper()
        }
        return Static.instance
    }
    
    let locationSource: LocationSource = LocationSource()
    var currentLocation: CLLocation? {
        return self.locationSource.currentLocation
    }
    var currentHeading: Double {
        return self.locationSource.currentLocation!.course
    }
    
    var completionBlock: ((String?) -> ())?
    
    init() {
        locationSource.delegate = self
    }
  

    
    func locationUpdated(location: CLLocation) {
        if let _completionBlock = completionBlock {
            _completionBlock(nil)
        }
    }
    
}