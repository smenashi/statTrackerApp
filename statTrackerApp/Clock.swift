//
//  Clock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/30/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation

class Clock {
    // <script src="https://gist.github.com/irace/de6d576f49dc2eec9b18.js"></script>
    private var startTime: NSDate?
    
    func start() {
        startTime = NSDate.init()
    }
    
    func stop() -> TimeInterval {
        if let time = startTime {
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
        //            let hours = Int(time) / 3600 (switched to just minutes and seconds
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        // string will be formatted with 2 digits for each of the values derived above
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
