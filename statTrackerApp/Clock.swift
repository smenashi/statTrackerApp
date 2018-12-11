//
//  Clock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/30/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//
//  Class Description:
//  This class implements a basic stopwatch function, used by the
//  various clock subtypes (PenaltyClock, PlayerClock, and GameClock).
//

import Foundation

class Clock {
    // <script src="https://gist.github.com/irace/de6d576f49dc2eec9b18.js"></script>
    private var startTime: NSDate?
    
    func start() {
    // Starts clock
        startTime = NSDate.init()
    }
    
    func stop() -> TimeInterval {
    // Stops clock, returning the time amount the clock has been on for
        if let time = startTime { // will only work if the clock has started
            startTime = nil
            let timeInt = NSDate.init().timeIntervalSince(time as Date)
            return timeInt
        }
        else {
            return 0
        }
    }

    
    func formatTime(time:TimeInterval) -> String{
        // formats the time on the time label to the desired format: hh:mm:ss
        // standard modular arithmetic to derive hours, minutes, seconds from given seconds
        // let hours = Int(time) / 3600 (switched to just minutes and seconds
        // <script src=https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f></script>
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        // string will be formatted with 2 digits for each of the values derived above
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
