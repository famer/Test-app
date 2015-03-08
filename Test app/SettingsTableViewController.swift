//
//  SettingsTableViewController.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var settings: NSDictionary = NSDictionary()
    var sections: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path: String = NSBundle.mainBundle().pathForResource("settings", ofType:"plist")!
        settings = NSDictionary(contentsOfFile: path)!
        sections = settings.allKeys as [String]
        print(sections)
         //data.valueForKey("Send location message scheme") as String
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (settings.valueForKey(sections[section]) as NSDictionary).allKeys.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Option Cell", forIndexPath: indexPath) as OptionTableViewCell
        //var options = (settings.objectForKey(sections[indexPath.section])!.allKeys)
        let optionTitle = (settings.objectForKey(sections[indexPath.section])!.allKeys)[indexPath.row]  as String
        //let optionValue = NSUserDefaults.standardUserDefaults().objectForKey(settings[indexPath.row])
        var optionValueLabel: String
        
        switch optionTitle {
        case "Units of length":
            ""//optionValueLabel = Weather.LengthMeasurement(optionValue).description()
        case "Units of temperature":
            ""//optionValueLabel = Weather.TemperatureMeasurement(optionValue).description()
        default:
            ""
            
        }
        
        cell.option = Option(title: optionTitle, value: "Units")
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "General"
    }

}
