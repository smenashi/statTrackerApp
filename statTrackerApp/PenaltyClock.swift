//
//  PenaltyClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import UIKit

class PenaltyClock: Clock {
    
    init(penaltyTime:TimeInterval, timeUI:UILabel, queue:PenaltyQueue) {
        _penaltyTime = penaltyTime
        _timeUI = timeUI
        q = queue
    }
    
    var _penaltyTime: TimeInterval
    var _timeUI:UILabel
    var timer = Timer()
    var timerDone = false
    var q:PenaltyQueue
    
    
    func runPenaltyClock() {
        runPenaltyTimer(_timerLabel: _timeUI)
    }
    
    //----- Timer object functions -----//
    // <script src=https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f></script>
    
    func runPenaltyTimer(_timerLabel:UILabel) {
        // runs the timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePenaltyTimer), userInfo: _timerLabel, repeats: true)
    }
    
    @objc func updatePenaltyTimer(timer: Timer) {
        let label:UILabel = timer.userInfo as! UILabel
        // updates the values displayed on the game time label
        // once timer runs out, will stop at 0:00
        if q.getClockPos(clock: self) < 2 {
            if _penaltyTime > 0 {
                if q.isClockOn() {
                    _penaltyTime -= 1
                }
            }
            else {
                timer.invalidate()
                q.removeClock()
            }
        }
        
        // update label with properly-formatted version:
        label.text = formatTime(time: TimeInterval(_penaltyTime))
    }
    
}


//----- Hash & Equate class extension -----//
// making class hashable for queuing
extension PenaltyClock: Equatable {
    static func == (lhs: PenaltyClock, rhs: PenaltyClock) -> Bool {
        return lhs._penaltyTime == rhs._penaltyTime &&
            lhs._timeUI == rhs._timeUI &&
            lhs.timer == rhs.timer &&
            lhs.timerDone == rhs.timerDone &&
            lhs.q == rhs.q
    }
}

extension PenaltyClock: Hashable {
    var hashValue: Int {
        return _penaltyTime.hashValue ^ _timeUI.hashValue ^ timer.hashValue ^ timerDone.hashValue ^ q.hashValue
    }
}


