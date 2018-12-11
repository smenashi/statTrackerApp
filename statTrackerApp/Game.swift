//
//  game.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/23/18.
//  Updated by Nick Chkonia and Chad Morse.
//  Copyright © 2018 Sophie Menashi. All rights reserved.

//  This class is functiomally is used as a controller for keeping track of the 22 Player object instances.
//  One instance of this class is initialized per game, in the ViewController

import UIKit
import Foundation

class Game {
    
    // optional attributes for implementing career-statistcs
    var _season = 2018
    var _gameId = 0
    var _opponent = "AWAY_TEAM"
    var onIce = Array<Player>()
    
    // players: need this to generate drop-down menus (see below)
    var players = Array<Player> ()
    var maxOnIce = 6
    
    init(player1:Player, player2:Player, player3:Player, player4:Player, player5:Player, player6:Player, player7:Player, player8:Player, player9:Player, player10:Player, player11:Player, player12:Player, player13:Player, player14:Player, player15:Player, player16:Player, player17:Player, player18:Player, player19:Player, player20:Player, player21:Player, player22:Player){
        
        players.append(player1)
        players[0].rosterPosition = 0
        players.append(player2)
        players[1].rosterPosition = 1
        players.append(player3)
        players[2].rosterPosition = 2
        players.append(player4)
        players[3].rosterPosition = 3
        players.append(player5)
        players[4].rosterPosition = 4
        players.append(player6)
        players[5].rosterPosition = 5
        players.append(player7)
        players[6].rosterPosition = 6
        players.append(player8)
        players[7].rosterPosition = 7
        players.append(player9)
        players[8].rosterPosition = 8
        players.append(player10)
        players[9].rosterPosition = 9
        players.append(player11)
        players[10].rosterPosition = 10
        players.append(player12)
        players[11].rosterPosition = 11
        players.append(player13)
        players[12].rosterPosition = 12
        players.append(player14)
        players[13].rosterPosition = 13
        players.append(player15)
        players[14].rosterPosition = 14
        players.append(player16)
        players[15].rosterPosition = 15
        players.append(player17)
        players[16].rosterPosition = 16
        players.append(player18)
        players[17].rosterPosition = 17
        players.append(player19)
        players[18].rosterPosition = 18
        players.append(player20)
        players[19].rosterPosition = 19
        players.append(player21)
        players[20].rosterPosition = 20
        players.append(player22)
        players[21].rosterPosition = 21
    }
    
    // Added by Nick and Sophie, for generating drop-down menus:
    // this will store the current players on ice in array form for the tableView object in ViewController to use
    // for the dropdown menues
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
    // This function puts a passed player onto the ice, enabling them logically
    // and updating the UI elements
        if addPlayer.inBox == false && getIce().count < maxOnIce{
            onIce.append(addPlayer)
            addPlayer.enablePlayer()
            addPlayer.startClock(manpower: manpower)
            addPlayer.playerButton?.backgroundColor = .green
        
        // update array of players to be displayed in drop-down menu
        currIce.append(addPlayer)
        }
    }
    
    func takeOffIce(removePlayer:Player) {
    // This function removed a passed player from the ice, disabling them logically
    // and updating the UI elements
        if !removePlayer.inBox { // check to make sure the player isn't in a penalty box, and thus unremovable
            onIce.remove(at: onIce.firstIndex(of: removePlayer)!)
            removePlayer.disablePlayer()
            removePlayer.stopClock()
            removePlayer.playerButton?.backgroundColor = UIColor(red: 0.83921569, green: 0.72941176, blue: 0.54509804, alpha: 1.0)
        }
        
        // update array of players to be displayed in drop-down menu, only if currIce contains the current player
        if currIce.contains(removePlayer) {
            currIce.remove(at: currIce.firstIndex(of: removePlayer)!)
        }
    }
    
    func getIce() -> Array<Player> {
        return onIce
    }
    
    func getPlayer(number:Int) -> Player {
        return players[number]
    }
    
    // stat buttons for multiple player tracking 
    func shotFor(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseShotFor(manpower: manpower)
        }
    }
    
    func shotAgainst(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseShotAgainst(manpower: manpower)
        }
    }
    
    func goalFor(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseGoalFor(manpower: manpower)
        }
    }
    
    func goalAgainst(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseGoalAgainst(manpower: manpower)
        }
    }
    
    
    func icing(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseIcing(manpower: manpower)
        }
    }
    
    func icingDrawn(manpower:[Int] = [5, 5]) {
        for player in onIce {
            player.increaseIcingDrawn(manpower: manpower)
        }
    }
    
}


