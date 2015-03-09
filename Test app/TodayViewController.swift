//
//  TodayViewController.swift
//  Test app
//
//  Created by Тимур Татаршаов on 07.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    
    @IBOutlet weak var cloudnessImage: UIImageView!
    @IBOutlet weak var currentLocationSign: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    var location: Location = Location() {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var locationHelper = LocationHelper.sharedInstance
        locationHelper.completionBlock = {result in
            (
            )
        }
        let mockLocation = Location(title: "Prague")
        mockLocation.currentWeather = Weather(temperature: 8, humidity: 52, precipitiation: 0.5, pressureMB: 1002, windSpeed: 20, windDirection: .NE, cloudness: Weather.Cloudness.Windy, date: NSDate())
        location = mockLocation
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    func updateUI() {
        
        currentLocationSign.hidden = !location.currentGeoLocation
        locationLabel.text = location.fullTitle
        
        
        if let weather = location.currentWeather {
            
            let lengthMeasure = Settings.LengthMeasurement(rawValue: Settings.getOptionValue("Unit of length"))!
            let tempertureMeasure = Settings.TemperatureMeasurement(rawValue: Settings.getOptionValue("Units of temperature"))!
            
            cloudnessImage.image = UIImage(named: weather.cloudness.imageName())
            
            weatherDescriptionLabel.text = "\(weather.getTemperature(tempertureMeasure)) \(tempertureMeasure.symbol) | \(weather.cloudness.description())"
            
            humidityLabel.text = "\(weather.humidity) %"
            precipitationLabel.text = "\(weather.precipitiation) mm"
            pressureLabel.text = "\(weather.pressureMB) hPa"
            windSpeedLabel.text = "\(weather.getWindSpeed(lengthMeasure)) \(lengthMeasure.symbol)/h"
            windDirectionLabel.text = "\(weather.windDirection.description())"
            
        }
    }
    
    
    @IBAction func shareAction(sender: AnyObject) {
        var sharingItems = [AnyObject]()
        let shareText = "Weather in \(location.title): \(weatherDescriptionLabel.text!)"
        sharingItems.append(shareText)
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        //activityViewController.excludedActivityTypes = [UIActivityTypeCopyToPasteboard,UIActivityTypeAirDrop,UIActivityTypeAddToReadingList,UIActivityTypeAssignToContact,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll,UIActivityTypePostToWeibo]
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    
    
}
