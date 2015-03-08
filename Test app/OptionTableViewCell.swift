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
        optionValueButton.titleLabel?.text = option.value
    }
    
    
    func saveOption(optionToSave: Option) {
        NSUserDefaults.standardUserDefaults().setObject(optionToSave.value, forKey: optionToSave.title)
    }

}
