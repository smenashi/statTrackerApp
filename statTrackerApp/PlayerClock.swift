//
//  PlayerClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation

class PlayerClock: Clock {
    var iceTime:[String:TimeInterval] = ["5v5":0, "5v4":0, "5v3":0, "4v5":0, "4v4":0, "4v3":0, "3v5":0, "3v4":0, "3v3":0]
    var _manpower: [Int] = [5, 5]
    
    func startClock (manpower: [Int]) {
        start()
        _manpower = manpower
    }
    
    func stopClock () {
        iceTime[aryToStr(manpower: _manpower)]! += stop()
        print(iceTime)
    }
    
    func getIceTime () -> TimeInterval {
        return iceTime[aryToStr(manpower: _manpower)]!
    }
    
    func getCurrManpower () -> String {
        return aryToStr(manpower: _manpower)
    }

    
    // convert manpower arrays into manpower strings
    func aryToStr(manpower:[Int]) -> String {
        let man1 = String(manpower[0])
        let man2 = String(manpower[1])
        return man1 + "v" + man2
    }
}
