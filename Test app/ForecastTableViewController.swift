//
//  ForecastTableViewController.swift
//  Test app
//
//  Created by Тимур Татаршаов on 06.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {
    
    let locationsSet = Locations.sharedInstance
    var location: Location = Location() {
        didSet {
            updateUI()
        }
    }
    var weeklyWeather: [Weather] {
        return location.weeklyWeather
    }
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let weather1 = Weather(temperature: 12, humidity: 52, precipitiation: 0.5, pressureMB: 1002, windSpeed: 20, windDirection: .NE, cloudness: Weather.Cloudness.Cloudy, date: NSDate())
        let weather2 = Weather(temperature: 15, humidity: 52, precipitiation: 0.5, pressureMB: 1002, windSpeed: 20, windDirection: .NE, cloudness: Weather.Cloudness.Sunny, date: NSDate().dateByAddingTimeInterval(60*60*24))
        
        location = Location(title: "Vienna")
        location.weeklyWeather = [weather1, weather2]
        */
        
        location = locationsSet.currentLocation
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        locationTitleLabel.text = location.title
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyWeather.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Weather Cell", forIndexPath: indexPath) as WeatherTableViewCell
        let weather = self.weeklyWeather[indexPath.row] as Weather
        cell.weather = weather
        return cell
    }

    
}
