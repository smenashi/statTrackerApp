//
//  GameClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.

//  Class Description:
//  This class, which inherits from the Clock superclass, creates an object to keep
//  track of the game's main clock. The clock runs for 20 minutes, being updated for
//  each new period. The class also implements a native Swift Timer object to update the
//  clock's UILabel each second that the clock is on.



import Foundation
import UIKit

class GameClock: Clock {
    var gameTime: TimeInterval = 1200 // this variable keeps track of the game time for player stats/database entry
    var gameSecondsUI: TimeInterval = 1200 // this variable keeps track of the game time for the UILabel
    var timeLeft = true
    var clockOnFlag = true //initializing as true for startup logic
    var timer = Timer()
    var period = 1
    
    func startGameClock(timerLabel:UILabel) {
    // this function re-validates and restarts the timer
        if timeLeft {
            start()
            clockOnFlag = true
            runGameTimer(_timerLabel: timerLabel)
        }
    }
    
    func stopGameClock() {
    // this function invalidates the current timer and records the current time elapsed
        let timeElapsed: TimeInterval = stop()
        gameTime -= timeElapsed
        clockOnFlag = false
        timer.invalidate()
        
        if gameTime < 0 {
            timeLeft = false
        }
    }
    
    func getGameTime() -> (String, Int) {
        let gameMin = formatTime(time: gameTime)
        return (gameMin, period)
    }
    
    func endPeriod() {
        // invalidates timer and incrememnts period by one
        period += 1
        timer.invalidate()
    }
    
    func startNewPeriod(timerLabel:UILabel) {
        // starts new period, reseting the time variables to 20 minutes (1200 seconds)
        // the clock starts off as "off" at the beginning of the new period
        gameTime = 1200
        gameSecondsUI = 1200
        timerLabel.text = formatTime(time: gameSecondsUI) // UILabel reset to display "20:00"
        timeLeft = true;

    }
    
    func endGame(timerLabel:UILabel) {
        // timer is invalidated and UILabel is set to "00:00"
        timer.invalidate()
        timerLabel.text = formatTime(time: TimeInterval(0))
    }
    
    //----- Timer object functions -----//
    // <script src=https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f></script>
    
    func runGameTimer(_timerLabel:UILabel) {
        // runs the timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateGameTimer), userInfo: _timerLabel, repeats: true)
        
    }
    
    @objc func updateGameTimer(timer: Timer) {
        let label:UILabel = timer.userInfo as! UILabel
        // updates the values displayed on the game time label
        // once timer runs out, will stop at 0:00
        if gameSecondsUI > 0 {
            gameSecondsUI -= 1
        }
        // update label with properly-formatted version:
        label.text = formatTime(time: TimeInterval(gameSecondsUI))
    }    
}

//----- Hash & Equate class extension -----//
// making class hashable for queuing
extension GameClock: Equatable {
    static func == (lhs: GameClock, rhs: GameClock) -> Bool {
        return lhs.gameTime == rhs.gameTime &&
            lhs.gameSecondsUI == rhs.gameSecondsUI &&
            lhs.timeLeft == rhs.timeLeft &&
            lhs.clockOnFlag == rhs.clockOnFlag &&
            lhs.timer == rhs.timer &&
            lhs.period == rhs.period
        
    }
    
}

extension GameClock: Hashable {
    var hashValue: Int {
        return gameTime.hashValue ^ gameSecondsUI.hashValue ^ timeLeft.hashValue ^ clockOnFlag.hashValue ^ timer.hashValue ^ period.hashValue
    }
}
