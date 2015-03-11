//
//  LocationTableViewCell.swift
//  Test app
//
//  Created by Тимур Татаршаов on 03.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit
import Foundation

class LocationTableViewCell: UITableViewCell {
    
    var location: Location = Location() {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var currentLocationSign: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var cellTemperature: UILabel!
    
    func updateUI() {
        let tempertureMeasure = Settings.TemperatureMeasurement(rawValue: Settings.getOptionValue("Units of temperature"))!
        
        cellTitle.text = location.title
        currentLocationSign.hidden = !location.currentGeoLocation
        
        let currentWeather = location.currentWeather
            weatherImage.image = UIImage(named: currentWeather.cloudness.imageName())
            self.cellSubtitle.text = currentWeather.cloudness.description()
            self.cellTemperature.text = "\(currentWeather.getTemperature(tempertureMeasure))°"
        
        

    }
    
    override func willTransitionToState(state: UITableViewCellStateMask) {
        super.willTransitionToState(state)
        if ((state & UITableViewCellStateMask.ShowingDeleteConfirmationMask) == UITableViewCellStateMask.ShowingDeleteConfirmationMask) {
            
            for view in self.subviews as [UIView] {
                //if view is UITableViewCellEditControl {
                  //  view.doClassThing()
                //}
            }

            
        }
    }
    
    override func didAddSubview(subview: UIView) {
        //println(NSStringFromClass(subview.classForCoder))
        
        //print(subview.description.lowercaseString)
        if NSStringFromClass(subview.classForCoder) == "UITableViewCellDeleteConfirmationView" {
            
            
            let imageButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80))
            let image = UIImage(named: "Delete")
            imageButton.setBackgroundImage(image, forState:.Normal)
            imageButton.setTitle("⨯", forState: .Normal)
            imageButton.userInteractionEnabled = false
            imageButton.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 30) //ProximaNova-Bold
            
            subview.addSubview(imageButton)
        }
    }
    
    
    
    

}
