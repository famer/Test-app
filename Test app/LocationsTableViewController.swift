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
        let location1 = Location(title: "NY")
        let location2 = Location(title: "SF")
        
        locations = [location1, location2]
        
        
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


}
