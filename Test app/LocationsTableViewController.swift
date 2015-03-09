//
//  LocationsTableViewController.swift
//  Test app
//
//  Created by Тимур Татаршаов on 04.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let location1 = Location(title: "Vienna")
        location1.currentGeoLocation = true
        location1.currentWeather = Weather(temperature: 12, humidity: 52, precipitiation: 0.5, pressureMB: 1002, windSpeed: 20, windDirection: .NE, cloudness: Weather.Cloudness.Sunny, date: NSDate())
        let location2 = Location(title: "Paris")
        location2.currentWeather = Weather(temperature: 8, humidity: 52, precipitiation: 0.5, pressureMB: 1002, windSpeed: 20, windDirection: .NE, cloudness: Weather.Cloudness.Cloudy, date: NSDate())
        
        locations = [location1, location2]
        
        
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Location Cell", forIndexPath: indexPath) as LocationTableViewCell
        let location = self.locations[indexPath.row] as Location
        cell.location = location
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
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "x"
    }
    


}
