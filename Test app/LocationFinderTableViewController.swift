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
        searchTextField.layer.cornerRadius = 5.0
        searchTextField.layer.borderColor = UIColor(rgb: 0x2f91ff).CGColor;
        searchTextField.layer.borderWidth = 1.0;
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
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