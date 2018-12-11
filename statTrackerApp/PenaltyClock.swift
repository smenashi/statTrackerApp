//
//  PenaltyClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.

//  Class Description:
//  This class, which inherits from Clock, utilizes a native swift Timer instance
//  in addition to the Clock functinoality (specifically time formmatting)
//  to keep track of the penalty times.
//

import Foundation
import UIKit

class PenaltyClock: Clock {
    
    init(penaltyTime:TimeInterval, timeUI:UILabel, queue:PenaltyQueue, jerseyLabel:UILabel) {
    // initializing values based on which type of penatly is initialized by the penalty queue
    // this class is linked to the penalty queue that creates it, so that the queue functions can be
    // called within the timer firing function, updatePenaltyTimer
        _penaltyTime = penaltyTime
        _timeUI = timeUI
        q = queue
        _jerseyLabel = jerseyLabel
    }
    
    var _penaltyTime: TimeInterval
    var _timeUI:UILabel
    var timer = Timer()
    var timerDone = false
    var q:PenaltyQueue
    var _jerseyLabel:UILabel
    
    //----- Timer object functions -----//
    // <script src=https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f></script>
    // The Timer object allwos for scheduled fire of a particular funciton, in this case, updatePenaltyTimer()
    
    func runPenaltyClock() {
        // the firing is set to a 1 second interval
        let _timerLabel = q.getNextTimer() // q.getNextTimer() is called from the queue to get the correct UI Label
        // runs the timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePenaltyTimer), userInfo: _timerLabel, repeats: true)
    }
    
    @objc func updatePenaltyTimer(timer: Timer) {
        let label:UILabel = timer.userInfo as! UILabel
        // updates the values displayed on the game time label
        // once timer runs out, the timer is invalidated and the penalty relase logic is initiated,
        // both within the PenaltyQueue class
        if q.getClockPos(clock: self) < 2 { // this if statement prevents the timer from firing until the plauyer is put in the box
            if _penaltyTime > 0 {
                if q.isClockOn() { // this if statement prevnts the timer from firing if the game clock is paused
                    _penaltyTime -= 1
                }
            }
            else {
                q.removeClock() // clock removal logic is carried out in the linked PenaltyQueue instance
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


