//
//  Player.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/21/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
//import SQLite

class Player {
    
    //funcitonal attributes
    var enabled = false
    // var clock
    
    // hard-coding these attributes for now
    var _firstName = "John"
    var _lastName = "Doe"
    var _jerseyNumber = 0
    
    // stat variables
    var shotFor = 0
    var shotAgainst = 0
    var goalFor = 0
    var goalAgainst = 0
    var penalty = 0
    
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
    
    // enabling/disabling
    func enablePlayer() {
        enabled = true
    }
    
    func disablePlayer() {
        enabled = false
    }
    
    func isEnabled() -> Bool {
        return enabled
    }
    
    // stat methods
    func increaseShotFor() {
        shotFor += 1
    }
    
    func increaseShotAgainst() {
        shotAgainst += 1
    }
    
    func increaseGoalFor() {
        goalFor += 1
    }
    
    func increaseGoalAgainst() {
        goalFor += 1
    }
    
    func increasePenalty() {
        penalty += 1
    }
    
}

// making class hashable to collect in set
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.enabled == rhs.enabled &&
            lhs._lastName == rhs._lastName &&
            lhs._firstName == rhs._firstName &&
            lhs._jerseyNumber == rhs._jerseyNumber &&
            lhs.shotFor == rhs.shotFor &&
            lhs.shotAgainst == rhs.shotAgainst &&
            lhs.goalFor == rhs.goalFor &&
            lhs.goalAgainst == rhs.goalAgainst &&
            lhs.penalty == rhs.penalty
    }
}

extension Player: Hashable {
    var hashValue: Int {
        return enabled.hashValue ^ _lastName.hashValue ^ _firstName.hashValue ^ _jerseyNumber.hashValue ^ shotFor.hashValue ^ shotAgainst.hashValue ^ goalFor.hashValue ^ goalAgainst.hashValue ^ penalty.hashValue
    }
}

