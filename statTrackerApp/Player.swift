//
//  Player.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/21/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
class Player {
    
    init(firstName:String, lastName:String, jerseyNum:Int) {
        _firstName = firstName
        _lastName = lastName
        _jerseyNumber = jerseyNum
    }
    
    //------ attributes ------//
    var _firstName:String
    var _lastName:String
    var _jerseyNumber:Int
    
    //funcitonal attributes
    var enabled = false
    var clock = PlayerClock()
    var iceTime:TimeInterval = 0
    
    // stat variables
    // dictionaries keyed by manpower
    // because of implicit optional keying, must force with ! in methods
    // shots
    var shotFor:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var shotForTaken:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var shotAgainst:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    // goals
    var goalFor:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var goalForTaken:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var goalAgainst:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    // 2-min penalties
    var penalty2min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var penaltyDrawn2min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    // 4-min penalties
    var penalty4min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var penaltyDrawn4min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    // 5-min penalties
    var penalty5min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var penaltyDrawn5min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    // icing
    var icing:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var icingByPlayer:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    var icingDrawn:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "3v5":0, "4v4":0]
    
    //------ methods ------//
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
    
    // clock methods
    func startClock() {
        clock.startClock()
    }
    
    func stopClock() {
        clock.stopClock()
        iceTime = getIceTime()
    }
    
    func getIceTime() -> TimeInterval {
        return clock.getIceTime()
    }
    
    // increasing stat methods --> insert statements go in these!
    func increaseShotFor(manpower:String = "5v5") {
        shotFor[manpower]! += 1
    }
    
    func increaseShotForTaken(manpower:String = "5v5") {
        shotForTaken[manpower]! += 1
    }
    
    func increaseShotAgainst(manpower:String = "5v5") {
        shotAgainst[manpower]! += 1
    }
    
    func increaseGoalFor(manpower:String = "5v5") {
        goalFor[manpower]! += 1
    }
    
    func increaseGoaltForTaken(manpower:String = "5v5") {
        goalForTaken[manpower]! += 1
    }
    
    func increaseGoalAgainst(manpower:String = "5v5") {
        goalAgainst[manpower]! += 1
    }
    
    func increasePenalty2min(manpower:String = "5v5") {
        penalty2min[manpower]! += 1
    }
    
    func increasePenaltyDrawn2min(manpower:String = "5v5") {
        penaltyDrawn2min[manpower]! += 1
    }
    
    func increasePenalty4min(manpower:String = "5v5") {
        penalty4min[manpower]! += 1
    }
    
    func increasePenaltyDrawn4min(manpower:String = "5v5") {
        penaltyDrawn4min[manpower]! += 1
    }
    
    func increasePenalty5min(manpower:String = "5v5") {
        penalty5min[manpower]! += 1
    }
    
    func increasePenaltyDrawn5min(manpower:String = "5v5") {
        penaltyDrawn5min[manpower]! += 1
    }
    
    func increaseIcing(manpower:String = "5v5") {
        icing[manpower]! += 1
    }
    
    func increaseIcingByPlayer(manpower:String = "5v5") {
        icingByPlayer[manpower]! += 1
    }
    
    func increaseIcingDrawn(manpower:String = "5v5") {
        icingDrawn[manpower]! += 1
    }
}

//----- Hash & Equate class extension -----//
// making class hashable for dropdown menus
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
            lhs.penalty2min == rhs.penalty2min &&
            lhs.penaltyDrawn2min == rhs.penaltyDrawn2min &&
            lhs.penalty4min == rhs.penalty4min &&
            lhs.penaltyDrawn4min == rhs.penaltyDrawn4min &&
            lhs.penalty5min == rhs.penalty5min &&
            lhs.penaltyDrawn5min == rhs.penaltyDrawn5min &&
            lhs.icing == rhs.icing &&
            lhs.icingByPlayer == rhs.icingByPlayer &&
            lhs.icingDrawn == rhs.icingDrawn
    }
}

extension Player: Hashable {
    var hashValue: Int {
        return enabled.hashValue ^ _lastName.hashValue ^ _firstName.hashValue ^ _jerseyNumber.hashValue ^ shotFor.hashValue ^ shotAgainst.hashValue ^ goalFor.hashValue ^ goalAgainst.hashValue ^ penalty2min.hashValue ^ penaltyDrawn2min.hashValue ^ penalty4min.hashValue ^ penaltyDrawn4min.hashValue ^ penalty5min.hashValue ^ penaltyDrawn5min.hashValue ^  icing.hashValue ^ icingByPlayer.hashValue ^ icingDrawn.hashValue
    }
}

