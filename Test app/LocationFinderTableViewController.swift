//
//  LocationFinder.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class LocationFinderTableViewController: UITableViewController, UITextFieldDelegate {
    
    let locationsSet = Locations.sharedInstance
    var locations: [String] = ["Vienna", "Prague", "San Francisco", "Tokyo"]
    var locationsFiltered: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mapKitView.layer.borderColor
        searchTextField.layer.cornerRadius = 5.0
        searchTextField.layer.borderColor = UIColor(rgb: 0x2f91ff).CGColor;
        searchTextField.layer.borderWidth = 1.0;
        locationsFiltered = locations
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsFiltered.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Location Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = locationsFiltered[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        locationsSet.addLocation(locationsFiltered[indexPath.row])
        locationsSet.saveState()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
    }
    
    
    @IBOutlet private weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
        }
    }
    
    @IBAction func changedText() {
        let text = searchTextField.text.lowercaseString
        if text != "" {
            locationsFiltered = []
            for location in locations {
                if location.lowercaseString.rangeOfString(text) != nil {
                    locationsFiltered.append(location)
                }
            }
        } else {
            locationsFiltered = locations
        }
        self.tableView.reloadData()
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
     func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }

    
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}