//
//  PenaltyQueue.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 12/3/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import UIKit

class PenaltyQueue {
    var playerList:[Player?] = [nil, nil, nil, nil, nil, nil]
    var playerBoxList:[UIButton?] = [nil, nil, nil, nil, nil, nil]
    var clockList:[PenaltyClock?] = [nil, nil, nil, nil, nil, nil]
    var timeList:[TimeInterval?] = [nil, nil, nil, nil, nil, nil]
    var availBoxList:[Bool] = [true, true]
    var _pbox1:UILabel
    var _pbox2:UILabel
    var _timerLabel1:UILabel
    var _timerLabel2:UILabel
    var _gameTimer:GameClock
    var manpowerPressed:() -> Void
    var manpowerReleased:() -> Void
    var usFlag = true
    var boxAvail = true
    var currBox = 0
    var count = 0
    var areQueuing = false
    var game:Game
    
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
            if currBox == 0 {
                return _pbox1
            } else {
                return _pbox2
            }
        }

        func getNextTimer() -> UILabel {
            if currBox == 0 {
                return _timerLabel1
            } else {
                return _timerLabel2
            }
        }
    
    func updateAvailBox() {
        if availBoxList[0] {
            currBox = 0
        } else if availBoxList[1] {
            currBox = 1
        } else {
            currBox = -1
        }
    }
    
    func getClockPos(clock: PenaltyClock) -> Int {
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
        closure()
    }
    
    func newUsPenalty(player:Player, time:TimeInterval, box:UIButton) {
        let index = addPlayerIntoQ(time: time)
        count += 1
        playerList[index] = player
        playerBoxList[index] = box
        timeList[index] = time
        box.backgroundColor = .red
        player.disablePlayer()
        manpowerSwitch {
            manpowerPressed()
        }
        if index < 2 {
            putInBox(_index: index, time:time)
        }
        game.currIce.remove(at:game.currIce.firstIndex(of: player)!)
    }
    
    func newThemPenalty(time:TimeInterval) {
        usFlag = false
        let index = addPlayerIntoQ(time: time)
        timeList[index] = time
        count += 1
        manpowerSwitch {
            manpowerPressed()
        }
        if index < 2 {
            putInBox(_index: index, time:time)
        }
    }
    
    func putInBox(_index:Int, time:TimeInterval) {
        var index = _index
        updateAvailBox()
        if areQueuing && timeList[1]! < timeList[0]! { // if queued penalty is less than remaining penalty after clear (edge case)
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
            //areQueuing = false
        }
        if usFlag {
            getNextBox().text = String(playerList[index]!._jerseyNumber)
        }
        clockList[index] = PenaltyClock(penaltyTime: time, timeUI: getNextTimer(), queue:self, jerseyLabel: getNextBox())
        clockList[index]!.runPenaltyClock()
        availBoxList[currBox] = false
        
    }
    
    func updateAvailBoxAfterRemove(index:Int) {
        if clockList[0]!._timeUI == _timerLabel1 {
            availBoxList[0] = true
        } else {
            availBoxList[1] = true
        }
    }
    
    func addPlayerIntoQ(time:TimeInterval) -> Int {
        var index = count
        var shift = 0
        if index > 1 {
            shift = 2
        }
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
    
    // put new player label into box
    func removeClock() {
        var index = 1
        clockList[0]!.timer.invalidate()
        clockList[0]!._timeUI.text = "00:00"
        updateAvailBoxAfterRemove(index:0)
        if usFlag {
            game.currIce.append(playerList[0]!)
            playerList[0]!.enablePlayer()
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
        } else {
//            clockList[0]!._jerseyLabel.text = "OPPONENT"
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
        if count > 1 {
            areQueuing = true
            putInBox(_index: 1, time: timeList[1]!)
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
