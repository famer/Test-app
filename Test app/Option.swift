//
//  Option.swift
//  Test app
//
//  Created by Тимур Татаршаов on 08.03.15.
//  Copyright (c) 2015 Timur Tatarshaov. All rights reserved.
//

import Foundation

class Option {
    
    var title: String = ""
    var value: String = ""
    
    init() {}
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
