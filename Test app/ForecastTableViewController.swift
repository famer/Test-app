//
//  ForecastTableViewController.swift
//  Test app
//
//  Created by Тимур Татаршаов on 06.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {
    
    var location: Location = Location()
    var forecast: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather1 = Weather(temperature: 21)
        let weather2 = Weather(temperature: 20)
        
        forecast = [weather1, weather2]
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Weather Cell", forIndexPath: indexPath) as WeatherTableViewCell
        let weather = self.forecast[indexPath.row] as Weather
        cell.weather = weather
        return cell
    }
    
    
    // Editing
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //navigation.places.deleteFromRemoved(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        
    }

    
}
