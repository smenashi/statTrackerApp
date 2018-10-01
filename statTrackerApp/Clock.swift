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
    
    var isRunning: Bool {
        return startTime != nil
    };
    
    func start() {
        startTime = NSDate.init()
    }
    
    func stop() -> TimeInterval {
        if let time = startTime {
            startTime = nil
            
            return NSDate.init().timeIntervalSince(time as Date)
        }
        else {
            return 0
        }
    }
}
