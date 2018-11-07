//
//  PlayerClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation

class PlayerClock: Clock {
    var iceTime: TimeInterval = 0
    
    func startClock () {
        start()
    }
    
    func stopClock () {
        iceTime += stop()
    }
    
    func getIceTime () -> TimeInterval {
        return iceTime
    }
}
