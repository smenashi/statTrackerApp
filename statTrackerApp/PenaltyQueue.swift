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
    //var boxLabelList:[UILabel?] = [nil, nil]
    var _pbox1:UILabel
    var _pbox2:UILabel
    var _timerLabel1:UILabel
    var _timerLabel2:UILabel
    var _gameTimer:GameClock
    var manpowerPressed:() -> Void
    var manpowerReleased:() -> Void
    var usFlag = true
    var boxAvail = true
    //    var currBox:UILabel
    //    var currTimer:UILabel
    
    init (gameTimer:GameClock, pbox1:UILabel, pbox2:UILabel, timerLabel1:UILabel, timerLabel2:UILabel, mP:@escaping ()->Void, mR:@escaping ()->Void) {
        _gameTimer = gameTimer
        _pbox1 = pbox1
        _pbox2 = pbox2
        //        currBox = _pbox1
        _timerLabel1 = timerLabel1
        _timerLabel2 = timerLabel2
        //currTimer = _timerLabel1
        manpowerPressed = mP
        manpowerReleased = mR
        
    }
    
    //    func getNextBox() -> UILabel {
    //        if currBox == _pbox1 {
    //            currBox = _pbox2
    //            return _pbox2
    //        } else {
    //            currBox = _pbox1
    //            return _pbox1
    //        }
    //    }
    //
    //    func getNextTimer() -> UILabel {
    //        if currTimer == _timerLabel1 {
    //            currTimer = _timerLabel2
    //            return _timerLabel2
    //        } else {
    //            currTimer = _timerLabel1
    //
    //        }
    //    }
    
    func getLastPos() -> Int {
        var i = 0
        while i < 6 {
            print(i)
            if playerList[i] != nil {
                i += 0
            } else {
                return i
            }
        }
        return -1
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
        if index < 2 {
            playerList[index] = player
            _pbox1.text = String(player._jerseyNumber)
            clockList[index] = PenaltyClock(penaltyTime: time, timeUI: _timerLabel1, queue:self)
            clockList[index]!.runPenaltyClock()
            playerBoxList[index] = box
            box.backgroundColor = .red
            player.disablePlayer()
            manpowerSwitch {
                manpowerPressed()
            }
            print(playerList)
        }
    }
    
    func newThemPenalty(time:TimeInterval) {
        usFlag = false
        let index = addPlayerIntoQ(time: time)
        clockList[index] = PenaltyClock(penaltyTime: time, timeUI: _timerLabel1, queue: self)
        clockList[index]!.runPenaltyClock()
        manpowerSwitch {
            manpowerPressed()
        }
    }
    
    func addPlayerIntoQ(time:TimeInterval) -> Int {
        var index = getLastPos()
        while index > 0 {
            if clockList[index - 1]!._penaltyTime > time {
                playerList[index] = playerList[index - 1]
                clockList[index] = clockList[index - 1]
                playerBoxList[index] = playerBoxList[index - 1]
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
        if usFlag {
            playerList[0]!.enablePlayer()
            playerBoxList[0]!.backgroundColor = .green
            manpowerSwitch {
                manpowerReleased()
            }
            _pbox1.text = "Jersey #"
            playerList[0] = nil
            clockList[0] = nil
            playerBoxList[0] = nil
            while clockList[index] != nil {
                playerList[index - 1] = playerList[index]
                clockList[index - 1] = clockList[index]
                playerBoxList[index - 1] = playerBoxList[index]
                index += 1
            }
        } else {
            manpowerSwitch {
                manpowerReleased()
            }
            _pbox1.text = "OPPONENT"
            clockList[0] = nil
            while clockList[index] != nil {
                clockList[index - 1] = clockList[index]
                index += 1
            }
            print(playerList)
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

