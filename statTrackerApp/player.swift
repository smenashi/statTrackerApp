//
//  player.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/21/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import SQLite

class Player {
    // hard-coding these attributes for now
    var _firstName = "John"
    var _lastName = "Doe"
    var _jerseyNumber = 0
 
/*
    // database attributes
    let firstName = Expression<String?>("firstName")
    let lastName = Expression<String?>("lastName")
    let jerseyNumber = Expression<Int64?>("jerseyNumber")

*/
    
    init(firstName:String, lastName:String, jerseyNum:Int) {
        _firstName = firstName
        _lastName = lastName
        _jerseyNumber = jerseyNum
    }
    
}
