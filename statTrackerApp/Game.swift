//
//  game.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/23/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//
import UIKit
import Foundation

class Game {
    var _season = 2018
    var _gameId = 0
    var _opponent = "AWAY_TEAM"
    var onIce = Set<Int>()
    
    // players: need this to generate drop-down menus (see below)
    var players = Array<Player> ()
    var maxOnIce = 6
    
    // hard-coding game
    init(player1:Player, player2:Player, player3:Player, player4:Player, player5:Player, player6:Player, player7:Player, player8:Player, player9:Player, player10:Player, player11:Player, player12:Player, player13:Player, player14:Player, player15:Player, player16:Player, player17:Player, player18:Player, player19:Player, player20:Player, player21:Player, player22:Player){
        
        players.append(player1)
        players.append(player2)
        players.append(player3)
        players.append(player4)
        players.append(player5)
        players.append(player6)
        players.append(player7)
        players.append(player8)
        players.append(player9)
        players.append(player10)
        players.append(player11)
        players.append(player12)
        players.append(player13)
        players.append(player14)
        players.append(player15)
        players.append(player16)
        players.append(player17)
        players.append(player18)
        players.append(player19)
        players.append(player20)
        players.append(player21)
        players.append(player22)
    }
    
    // Added by Nick and Sophie, for generating drop-down menus:
    // this will store the current players on ice in array form for the tableView object in ViewController to use
    var currIce: Array<Player> = Array()
    
    func getOnIceNumbersAsArray()->Array<Int> {
        var currIceArray = Array<Int>()
        var i = 0
        while i < currIce.count {
            currIceArray.append(currIce[i]._jerseyNumber)
            i += 1
        }
        while i < 6 {
            currIceArray.append(0)
            i += 1
        }
        
        return currIceArray
        
    }

    
    // getting players
    func getAllPlayers() -> Array<Player> {
        return players
    }
    

    // managing ice
    func iceIsFull() -> Bool {
        return onIce.count == 6
    }
    
    func putOnIce(addPlayer:Player, manpower: [Int]) {
        if addPlayer.inBox == false && getIce().count < maxOnIce{
            onIce.insert(players.firstIndex(of: addPlayer)!)
            addPlayer.enablePlayer()
            addPlayer.startClock(manpower: manpower)
            addPlayer.playerButton?.backgroundColor = .green
        
        // update array of players to be displayed in drop-down menu
        currIce.append(addPlayer)
        }
    }
    
    func takeOffIce(removePlayer:Player) {
        onIce.remove(players.firstIndex(of: removePlayer)!)
        removePlayer.disablePlayer()
        removePlayer.stopClock()
        removePlayer.playerButton?.backgroundColor = UIColor(red: 0.83921569, green: 0.72941176, blue: 0.54509804, alpha: 1.0)
      
        // update array of players to be displayed in drop-down menu
        currIce.remove(at: players.firstIndex(of: removePlayer)!)
    }
    
    func getIce() -> Set<Int> {
        return onIce
    }
    
    func getPlayer(number:Int) -> Player {
        return players[number]
    }
    
    // stat buttons
    func shotFor(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseShotFor(manpower: manpower)
        }
    }
    
    func shotAgainst(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseShotAgainst(manpower: manpower)
        }
    }
    
    func goalFor(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseGoalFor(manpower: manpower)
        }
    }
    
    func goalAgainst(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseGoalAgainst(manpower: manpower)
        }
    }
    
    
    func icing(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseIcing(manpower: manpower)
        }
    }
    
    func icingDrawn(manpower:[Int] = [5, 5]) {
        for player in onIce {
            players[player].increaseIcingDrawn(manpower: manpower)
        }
    }
    
}


