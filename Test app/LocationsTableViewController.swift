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
    let locationsSet = Locations.sharedInstance
    var locationsArray: [String] {
        get {
            return locationsSet.locationsString
        }
        set {
            locationsSet.locationsString = newValue
        }
    }
    
    //var tableViewNew: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

        /*
        tableViewNew = self.tableView
        
        var replacementView: UIView = UIView(frame: self.tableView.frame)
        replacementView.addSubview(tableViewNew!)
        
        
        let addButton = self.tableViewNew!.tableFooterView!
        
        
        replacementView.addSubview(addButton)
        
        self.view = replacementView
        */
        
        
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainLoop: for locationName in locationsArray {
            for location in locations {
                if locationName == location.title {
                    continue mainLoop
                }
            }
            let location = Location(title: locationName)
            locations.append(location)
            location.load({
                self.updateUI()
            })
        }
        
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //locationsSet.currentLocationString = locationsSet.locations[indexPath.row]
        locationsSet.currentLocation = locations[indexPath.row]
        self.dismissViewControllerAnimated(true, completion: nil)
        locationsSet.saveState()
    }

    
    // Editing
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            locations.removeAtIndex(indexPath.row)
            var newLocationsArray: [String] = []
            for location in locations {
                newLocationsArray.append(location.title)
            }
            locationsArray = newLocationsArray
            locationsSet.saveState()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Delete"
    }
    


}
