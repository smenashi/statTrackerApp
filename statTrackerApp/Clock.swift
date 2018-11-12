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
}
