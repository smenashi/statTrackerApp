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
    
    func startGameClock() {
        if gameTime > 0 {
            start()
        }
    }
    
    func stopGameClock() {
        let timeElapsed: TimeInterval = stop()
        gameTime -= timeElapsed
    }
    
    func startNewPeriod() {
        gameTime = 1200
    }
}

/*    // -------------------------------------------------------------------------------
 // Game Clock Button: this starts/stops the countdown timer for the game
 // ref: https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
 
 
 // running value that will be updated
 var gameSeconds = 1200                  // 1200 for real game
 // init timer object
 var gameTimer = Timer()
 // to reset timer whenever a period ends
 var newPeriod = true
 
 // boolean making sure only one timer is created
 var isTimerRunning = false
 
 // gates game clock button usage
 var clockPaused = true
 
 // clock labels: change based on state
 @IBOutlet weak var startLabel: UILabel!
 @IBOutlet weak var stopLabel: UILabel!
 
 
 
 @IBAction func onClickGameClock(_ sender: Any) {
 // CLOCK button clicked:
 playersDropDown.reloadData() // reload drop-down data
 if newPeriod == true{   // check if we started a new period
 gameSeconds = 1200  // reset time, 1200 for real game
 newPeriod = false   // update flag
 stopLabel.alpha = 1   //make stop label more opaque: "click to stop"
 startLabel.alpha = 0.4    // make start label less opaque
 }
 
 if self.clockPaused == false{
 // pauses the clock and changes boolean value
 gameTimer.invalidate()
 isTimerRunning = true
 self.clockPaused = true
 stopLabel.alpha = 0.4
 startLabel.alpha = 1
 for player in game.getIce() {
 game.getPlayer(number: player).stopClock()
 }
 }
 
 else{
 // continues running the timer
 runTimer()
 self.clockPaused = false
 isTimerRunning = true
 stopLabel.alpha = 1   //make stop label more opaque: "click to stop"
 startLabel.alpha = 0.4   // make start label less opaque
 for player in game.getIce() {
 game.getPlayer(number: player).startClock()
 }
 }
 }
 
 func runTimer() {
 // runs the timer countdown
 gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
 isTimerRunning = true
 }
 
 @objc func updateTimer() {
 // updates the values displayed on the game time label
 gameSeconds -= 1
 // update label with properly-formatted version:
 gameTime.text = formatTime(time: TimeInterval(gameSeconds))
 }
 
 func formatTime(time:TimeInterval) -> String{
 // formats the time on the time label to the desired format: hh:mm:ss
 // standard modular arithmetic to derive hours, minutes, seconds from given seconds
 //            let hours = Int(time) / 3600 (switched to just minutes and seconds
 let minutes = Int(time) / 60 % 60
 let seconds = Int(time) % 60
 
 // string will be formatted with 2 digits for each of the values derived above
 return String(format:"%02i:%02i", minutes, seconds)
 }*/
