//
//  OptionTableViewCell.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    
    var option: Option = Option() {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var optionTitleLabel: UILabel!
    @IBOutlet weak var optionValueButton: UIButton!
    
    func updateUI() {
        optionTitleLabel.text = option.title
        //optionValueButton.titleLabel?.text = "asdf"//option.value
        optionValueButton.setTitle(option.value, forState: .Normal)
    }
    
    
    @IBAction func changeOption(sender: AnyObject) {
        option.nextValue()
        optionValueButton.setTitle(option.value, forState: .Normal)
        saveOption()
    }
    
    func saveOption() {
        Settings.setOptionValue(option.title, value: option.intValue)
    }

}
