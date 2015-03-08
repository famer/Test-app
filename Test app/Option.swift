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
    var value: String  {
        return values[intValue]
    }
    var intValue: Int = 0
    var values: [String] = []
    
    init() {}
    
    init(title: String, value: Int, values: [String]) {
        self.title = title
        self.intValue = value
        self.values = values
    }
    
    func nextValue() {
        intValue = (intValue + 1) % values.count
    }
}
