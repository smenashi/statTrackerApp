//
//  GameClock.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 11/5/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import UIKit

class GameClock: Clock {
    var gameTime: TimeInterval = 1200
    var gameSecondsUI: TimeInterval = 1200
    var timeLeft = true
    var clockOnFlag = true //initializing as true for startup logic
    var timer = Timer()
    
    func runTimer(_timerLabel:UILabel) {
        // runs the timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: _timerLabel, repeats: true)
        clockOnFlag = true
    }
    
    @objc func updateTimer(timer: Timer) {
        let label:UILabel = timer.userInfo as! UILabel
        // updates the values displayed on the game time label
        gameSecondsUI -= 1
        // update label with properly-formatted version:
        label.text = formatTime(time: TimeInterval(gameSecondsUI))
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
    
    func startGameClock(timerLabel:UILabel) {
        if timeLeft {
            start()
            runTimer(_timerLabel: timerLabel)
        }
    }
    
    func stopGameClock() {
        let timeElapsed: TimeInterval = stop()
        gameTime -= timeElapsed
        clockOnFlag = false
        timer.invalidate()
        
        if gameTime < 0 {
            timeLeft = false
        }
    }
    
    func startNewPeriod(timerLabel:UILabel) {
        gameTime = 1200
        gameSecondsUI = 1200
        timerLabel.text = formatTime(time: gameSecondsUI)
    }
    
    func endGame(timerLabel:UILabel) {
        timerLabel.text = formatTime(time: TimeInterval(0))
    }
    
}
