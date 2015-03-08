//
//  LocationFinder.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class LocationFinderTableViewController: UITableViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mapKitView.layer.borderColor
        searchTextField.layer.cornerRadius = 10.0
        searchTextField.layer.borderColor = UIColor.blueColor().CGColor;
        searchTextField.layer.borderWidth = 1.0;
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    
}
