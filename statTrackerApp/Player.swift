//
//  Player.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/21/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
class Player {
    
    init(studentID:Int, lastName:String, jerseyNum:Int) {
        _studentID = studentID
        _lastName = lastName
        _jerseyNumber = jerseyNum
    }
    
    //------ attributes ------//
    var _studentID:Int
    var _lastName:String
    var _jerseyNumber:Int
    
    //funcitonal attributes
    var enabled = false
    var clock = PlayerClock()
    
    // stat variables
    // dictionaries keyed by manpower
    // because of implicit optional keying, must force with ! in methods
    
    // ice time
    var iceTime:[String:TimeInterval] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // shots
    var shotFor:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var shotForTaken:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var shotAgainst:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // goals
    var goalFor:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var goalForTaken:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var goalAgainst:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // 2-min penalties
    var penalty2min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var penaltyDrawn2min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // 4-min penalties
    var penalty4min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var penaltyDrawn4min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // 5-min penalties
    var penalty5min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var penaltyDrawn5min:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
    // icing
    var icing:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var icingByPlayer:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var icingDrawn:[String: Int] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    
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
    
    func stopClock(manpower:[Int]) {
        clock.stopClock()
        let time = getIceTime()
        iceTime[aryToStr(manpower: manpower)] = time
    }
    
    func getIceTime() -> TimeInterval {
        return clock.getIceTime()
    }
    
    // convert manpower arrays into manpower strings
    func aryToStr(manpower:[Int]) -> String {
        let man1 = String(manpower[0])
        let man2 = String(manpower[1])
        return man1 + "v" + man2
    }
    
    // increasing stat methods --> insert statements go in these!
    func increaseShotFor(manpower:[Int] = [5, 5]) {
        shotFor[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseShotForTaken(manpower:[Int] = [5, 5]) {
        shotForTaken[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseShotAgainst(manpower:[Int] = [5, 5]) {
        shotAgainst[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseGoalFor(manpower:[Int] = [5, 5]) {
        goalFor[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseGoaltForTaken(manpower:[Int] = [5, 5]) {
        goalForTaken[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseGoalAgainst(manpower:[Int] = [5, 5]) {
        goalAgainst[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenalty2min(manpower:[Int] = [5, 5]) {
        penalty2min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenaltyDrawn2min(manpower:[Int] = [5, 5]) {
        penaltyDrawn2min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenalty4min(manpower:[Int] = [5, 5]) {
        penalty4min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenaltyDrawn4min(manpower:[Int] = [5, 5]) {
        penaltyDrawn4min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenalty5min(manpower:[Int] = [5, 5]) {
        penalty5min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increasePenaltyDrawn5min(manpower:[Int] = [5, 5]) {
        penaltyDrawn5min[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseIcing(manpower:[Int] = [5, 5]) {
        icing[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseIcingByPlayer(manpower:[Int] = [5, 5]) {
        icingByPlayer[aryToStr(manpower: manpower)]! += 1
    }
    
    func increaseIcingDrawn(manpower:[Int] = [5, 5]) {
        icingDrawn[aryToStr(manpower: manpower)]! += 1
    }
}

//----- Hash & Equate class extension -----//
// making class hashable for dropdown menus
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.enabled == rhs.enabled &&
            lhs._lastName == rhs._lastName &&
            lhs._studentID == rhs._studentID &&
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
        return enabled.hashValue ^ _lastName.hashValue ^ _studentID.hashValue ^ _jerseyNumber.hashValue ^ shotFor.hashValue ^ shotAgainst.hashValue ^ goalFor.hashValue ^ goalAgainst.hashValue ^ penalty2min.hashValue ^ penaltyDrawn2min.hashValue ^ penalty4min.hashValue ^ penaltyDrawn4min.hashValue ^ penalty5min.hashValue ^ penaltyDrawn5min.hashValue ^  icing.hashValue ^ icingByPlayer.hashValue ^ icingDrawn.hashValue
    }
}

