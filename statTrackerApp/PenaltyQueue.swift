//
//  PenaltyQueue.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 12/3/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//
//  Class Description:
//  This class creates a modified priority queue for keeping track of the penalized players
//  in box and queued to be in the box (i.e. the third, fourth, etc. player penalized at one
//  time, a very rare edge case). The queue is prioritized by time remaining, so that the player
//  with the least time remaining is released first. The queue is modified slightly to make sure
//  that players not in-box with smaller penalites aren't queued before the in-box players (again,
//  a rare edge case). One queue is created for both the Home and Opponent penalty boxes, referred
//  to as "Us" and "Them."

import Foundation
import UIKit

class PenaltyQueue {
    // each list is intialized with six null values, represented the possible six players that
    // can be penalized at one time
    var clockList:[PenaltyClock?] = [nil, nil, nil, nil, nil, nil]
    var timeList:[TimeInterval?] = [nil, nil, nil, nil, nil, nil]
    var availBoxList:[Bool] = [true, true]
    
    // these lists are used for UI elements, as well as disabling penalized players for "Us" penalties
    var playerList:[Player?] = [nil, nil, nil, nil, nil, nil]
    var playerBoxList:[UIButton?] = [nil, nil, nil, nil, nil, nil]
    
    // these variables represent each the UI components of a penalty box, which includes the "Jersey #" label,
    // _pbox#, and the timer label, _timerLabel#, and are intizalized by passing the corresponding UILables to
    // the object init
    var _pbox1:UILabel
    var _pbox2:UILabel
    var _timerLabel1:UILabel
    var _timerLabel2:UILabel
    
    // these variables are also passed during the constructor call, and bring in ViewController funcationality,
    // specifically in relation to the game clock (for pausing the penalties) and the UI manpower configuring
    var _gameTimer:GameClock
    var manpowerPressed:() -> Void
    var manpowerReleased:() -> Void
    var game:Game
    
    // these variables are for logic control
    var usFlag = true
    var boxAvail = true
    var currBox = 0
    var count = 0
    var areQueuing = false
 
    
    init (gameTimer:GameClock, pbox1:UILabel, pbox2:UILabel, timerLabel1:UILabel, timerLabel2:UILabel, mP:@escaping ()->Void, mR:@escaping ()->Void, _game:Game) {
        _gameTimer = gameTimer
        _pbox1 = pbox1
        _pbox2 = pbox2
        _timerLabel1 = timerLabel1
        _timerLabel2 = timerLabel2
        manpowerPressed = mP
        manpowerReleased = mR
        game = _game
    }
    
    func getNextBox() -> UILabel {
    // This function gets the next available box label
        if currBox == 0 {
            return _pbox1
        } else {
            return _pbox2
        }
    }
    
    func getNextTimer() -> UILabel {
    // This funciton gets the next available timer label
        if currBox == 0 {
            return _timerLabel1
        } else {
            return _timerLabel2
        }
    }
    
    func updateAvailBox() {
    // This function updates the available box list, which keeps
    // track of which boxes are in use
        if availBoxList[0] {
            currBox = 0
        } else if availBoxList[1] {
            currBox = 1
        } else {
            currBox = -1
        }
    }
    
    func getClockPos(clock: PenaltyClock) -> Int {
    // This function is called in the PenaltyClock class for preventing
    // penalties not currently in-box from running, will return 0-5, 0-1
    // indicatin the clock is in-box, 2-5 indicating the penalty is queued
        var c = 0
        while c > 6 {
            if clockList[c]! == clock {
                return c
            }
            c += 1
        }
        return -1
    }
    
    func isClockOn() -> Bool {
        return _gameTimer.clockOnFlag
    }
    
    func manpowerSwitch(closure:() -> Void ) {
    // This function helps with ease of calling the UI manpower functions
    // passed in the constructor from the ViewController
        closure()
    }
    
    func newUsPenalty(player:Player, time:TimeInterval, box:UIButton) {
    // This funciton queues a new penalty if it is a "Us" penalty, which requires
    // the jersey label to updated, as well as the game logic for player availabilty,
    // in addition to the manpower configuration.
        
        // the player is added into the queue based on priority
        // as well as number of players currently queued
        let index = addPlayerIntoQ(time: time)
        
        count += 1
        playerList[index] = player
        playerBoxList[index] = box
        timeList[index] = time
        
        // the clicked player's box is colored red, the clicked player disabled, and the manpower
        // is updated
        box.backgroundColor = .red
        player.disablePlayer()
        player.inBox = true
        manpowerSwitch {
            manpowerPressed()
        }
        if index < 2 { // if the player is in a box position (0 or 1), they are put in the box
            putInBox(_index: index, time:time)
        }
        
        // the clicked player is removed from currIce, prevented that player
        // from being selected for committing an event, and from being credited with being on
        // the ice when an event occurs
        game.currIce.remove(at:game.currIce.firstIndex(of: player)!)
    }
    
    func newThemPenalty(time:TimeInterval) {
    // This funciton queues a new penalty if it is a "Them" penalty, which requires less
    // interaciton with UI and game logic
        usFlag = false
        
        // the player is added into the queue based on priority
        // as well as number of players currently queued
        let index = addPlayerIntoQ(time: time)
        
        // for "Them" penalties, we don't care about the player click, so we just place the penalty-time
        // into the timeList and reconfigure the manpwoer
        timeList[index] = time
        count += 1
        manpowerSwitch {
            manpowerPressed()
        }
        if index < 2 { // if the player is in a box position (0 or 1), they are put in the box
            putInBox(_index: index, time:time)
        }
    }
    
    func putInBox(_index:Int, time:TimeInterval) {
    // If a new penalty is in an in-box position, they will be visually and logically put in the box.
        var index = _index
        updateAvailBox() // available boxes are updated
        
        // if queued penalty is less than remaining penalty after clear (edge case)
        // it will be moved to the front
        if areQueuing && timeList[1]! < timeList[0]! {
            let tempPlayer = playerList[1]
            let tempTime = timeList[1]
            let tempBox = playerBoxList[1]
            playerList[1] = playerList[0]
            playerBoxList[1] = playerBoxList[0]
            timeList[1] = timeList[0]
            clockList[1] = clockList[0]
            playerList[0] = tempPlayer
            playerBoxList[0] = tempBox
            timeList[0] = tempTime
            index = 0
        }
    
        if usFlag { // if an "Us" penalty, update UI variables
            getNextBox().text = String(playerList[index]!._jerseyNumber)
        }
        
        // once put in a box, the penaltyClock is creted and starts running
        clockList[index] = PenaltyClock(penaltyTime: time, timeUI: getNextTimer(), queue:self, jerseyLabel: getNextBox())
        clockList[index]!.runPenaltyClock()
        availBoxList[currBox] = false
        
    }
    
    func updateAvailBoxAfterRemove(index:Int) {
    // This function updates the available boxes if there is a goal, and thus a forced remove
        if clockList[0]!._timeUI == _timerLabel1 {
            availBoxList[0] = true
        } else {
            availBoxList[1] = true
        }
    }
    
    func addPlayerIntoQ(time:TimeInterval) -> Int {
    // This funciton adds a penalty into the the queue, based on the penalty time
    // If the queue is empty or has one player, the player will be queued in either
    // the 0 or 1 position, if not, 2-5
        var index = count
        var shift = 0
        if index > 1 { // for determining where to start the queuing
            shift = 2
        }
        
        // this while loop shifts players based on the priority factor, time
        while index > shift {
            if timeList[index - 1]! > time {
                playerList[index] = playerList[index - 1]
                clockList[index] = clockList[index - 1]
                playerBoxList[index] = playerBoxList[index - 1]
                timeList[index] = timeList[index - 1]
                index -= 1
            } else {
                return index
            }
        }
        return index
    }
    
    func removeClock() {
    // This function removes the first player in the queue
        var index = 1
        clockList[0]!.timer.invalidate()
        clockList[0]!._timeUI.text = "00:00"
        updateAvailBoxAfterRemove(index:0)
        
        // if an "Us" penalty, the UI elements are updated, and all lists
        // are shifted in queuing process
        if usFlag {
            game.currIce.append(playerList[0]!)
            playerList[0]!.enablePlayer()
            playerList[0]!.inBox = false
            playerBoxList[0]!.backgroundColor = .green
            clockList[0]!._jerseyLabel.text = "Jersey #"
            playerList[0] = nil
            clockList[0] = nil
            playerBoxList[0] = nil
            timeList[0] = nil
            while timeList[index] != nil {
                playerList[index - 1] = playerList[index]
                clockList[index - 1] = clockList[index]
                playerBoxList[index - 1] = playerBoxList[index]
                timeList[index - 1] = timeList[index]
                index += 1
            }
            
        // if a "them" penalty, we don't care about the UI and only need to worry
        // about shiftin the clock and time lists
        } else {
            clockList[0] = nil
            while timeList[index] != nil {
                clockList[index - 1] = clockList[index]
                timeList[index - 1] = timeList[index]
                index += 1
            }
        }
        playerList[count - 1] = nil
        clockList[count - 1] = nil
        playerBoxList[count - 1] = nil
        timeList[count - 1] = nil
        count -= 1
        
        // if there is a player queued and not in-box, they are put in box and the manpower
        // is unaffected
        if count > 1 {
            areQueuing = true
            putInBox(_index: 1, time: timeList[1]!)
            
        // otherwise, manpower is reconfigured
        } else {
            manpowerSwitch {
                manpowerReleased()
            }
        }
    }
}

//----- Hash & Equate class extension -----//
// making class hashable for queuing
extension PenaltyQueue: Equatable {
    static func == (lhs: PenaltyQueue, rhs: PenaltyQueue) -> Bool {
        return lhs.playerList == rhs.playerList &&
            lhs.playerBoxList == rhs.playerBoxList &&
            lhs.clockList == rhs.clockList &&
            lhs._gameTimer == rhs._gameTimer &&
            lhs.usFlag == rhs.usFlag &&
            lhs.boxAvail == rhs.boxAvail
        
    }
}

extension PenaltyQueue: Hashable {
    var hashValue: Int {
        return playerList.hashValue ^ playerBoxList.hashValue ^ clockList.hashValue ^ _gameTimer.hashValue ^ usFlag.hashValue ^ boxAvail.hashValue
    }
}
