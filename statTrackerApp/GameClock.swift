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
    
    func startGameClock(timerLabel:UILabel) {
        if timeLeft {
            start()
            runGameTimer(_timerLabel: timerLabel)
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
    
    //----- Timer object functions -----//
    // <script src=https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f></script>
    
    func runGameTimer(_timerLabel:UILabel) {
        // runs the timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateGameTimer), userInfo: _timerLabel, repeats: true)
        clockOnFlag = true
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
