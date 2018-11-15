//
//  game.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/23/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation

class Game {
    var _season = 2018
    var _gameId = 0
    var _opponent = "AWAY_TEAM"
    var onIce = Set<Int>()
    
    // players: need this to generate drop-down menus (see below)
    var players = Array<Player> ()
    
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
    
    // Added by Nick, for generating drop-down menus:
    // this will store the current players on ice in array form for the tableView object in ViewController to use
    var currIce: Array<Player> = Array()
    // this will store the names of current players to display on the screen
    var currIceNames: Array<String> = Array()
    // will store the string label corresponding to each player to be displayed on the screen
    var labelString = ""
    
    func getOnIceSIDAsArray()->Array<Int> {
        var p1:Int = 0
        var p2:Int = 0
        var p3:Int = 0
        var p4:Int = 0
        var p5:Int = 0
        var p6:Int = 0
        if currIce.count >= 6 {
            p1 = currIce[0]._studentID
            p2 = currIce[1]._studentID
            p3 = currIce[2]._studentID
            p4 = currIce[3]._studentID
            p5 = currIce[4]._studentID
            p6 = currIce[5]._studentID
        }
        else if currIce.count == 5 {
            p1 = currIce[0]._studentID
            p2 = currIce[1]._studentID
            p3 = currIce[2]._studentID
            p4 = currIce[3]._studentID
            p5 = currIce[4]._studentID
        }
        else{
            p1 = currIce[0]._studentID
            p2 = currIce[1]._studentID
            p3 = currIce[2]._studentID
            p4 = currIce[3]._studentID
        }
        return [p1, p2, p3, p4, p5, p6]
        
    }

    
    // getting players
    func getAllPlayers() -> Array<Player> {
        return players
    }
    
    func getPlayer1() -> Player {
        return players[0]
    }
    func getPlayer2() -> Player {
        return players[1]
    }
    func getPlayer3() -> Player {
        return players[2]
    }
    func getPlayer4() -> Player {
        return players[3]
    }
    func getPlayer5() -> Player {
        return players[4]
    }
    func getPlayer6() -> Player {
        return players[5]
    }
    func getPlayer7() -> Player {
        return players[6]
    }
    func getPlayer8() -> Player {
        return players[7]
    }
    func getPlayer9() -> Player {
        return players[8]
    }
    func getPlayer10() -> Player {
        return players[9]
    }
    func getPlayer11() -> Player {
        return players[10]
    }
    func getPlayer12() -> Player {
        return players[11]
    }
    func getPlayer13() -> Player {
        return players[12]
    }
    func getPlayer14() -> Player {
        return players[13]
    }
    func getPlayer15() -> Player {
        return players[14]
    }
    func getPlayer16() -> Player {
        return players[15]
    }
    func getPlayer17() -> Player {
        return players[16]
    }
    func getPlayer18() -> Player {
        return players[17]
    }
    func getPlayer19() -> Player {
        return players[18]
    }
    func getPlayer20() -> Player {
        return players[19]
    }
    func getPlayer21() -> Player {
        return players[20]
    }
    func getPlayer22() -> Player {
        return players[21]
    }
    
    // managing ice
    func iceIsFull() -> Bool {
        return onIce.count == 6
    }
    
    func putOnIce(addPlayer:Player) {
        onIce.insert(players.firstIndex(of: addPlayer) ?? -1)
        addPlayer.enablePlayer()
        addPlayer.startClock()
        
        // update array of players to be displayed in drop-down menu
        updateCurrentIce()
        
    }
    
    func takeOffIce(removePlayer:Player) {
        onIce.remove(players.firstIndex(of: removePlayer) ?? -1)
        removePlayer.disablePlayer()
        removePlayer.stopClock()
      
        // update array of players to be displayed in drop-down menu
        updateCurrentIce()
    }
    
    func getIce() -> Set<Int> {
        return onIce
    }
    
    func getPlayer(number:Int) -> Player {
        return players[number]
    }
    
    // stat buttons
    func shotFor(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseShotFor(manpower: manpower)
        }
        //players[takenBy].increaseShotForTaken(manpower: manpower)
    }
    
    func shotAgainst(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseShotAgainst(manpower: manpower)
        }
    }
    
    func goalFor(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseGoalFor(manpower: manpower)
        }
        //players[takenBy].increaseGoaltForTaken(manpower: manpower)
    }
    
    func goalAgainst(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseGoalAgainst(manpower: manpower)
        }
    }
    
    func penalty2min(penaltyBy:Int, manpower:String = "5v5") {
        players[penaltyBy].increasePenalty2min(manpower: manpower)
    }
    
    func penaltyDrawn2min(drawnBy:Int, manpower:String = "5v5") {
        players[drawnBy].increasePenaltyDrawn2min(manpower: manpower)
    }
    
    func penalty4min(penaltyBy:Int, manpower:String = "5v5") {
        players[penaltyBy].increasePenalty4min(manpower: manpower)
    }
    
    func penaltyDrawn4min(drawnBy:Int, manpower:String = "5v5") {
        players[drawnBy].increasePenaltyDrawn4min(manpower: manpower)
    }
    
    func penalty5min(penaltyBy:Int, manpower:String = "5v5") {
        players[penaltyBy].increasePenalty5min(manpower: manpower)
    }
    
    func penaltyDrawn5min(drawnBy:Int, manpower:String = "5v5") {
        players[drawnBy].increasePenaltyDrawn5min(manpower: manpower)
    }
    
    func icing(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseIcing(manpower: manpower)
        }
        //players[drawnBy].increaseIcingByPlayer(manpower: manpower)
    }
    
    func icingDrawn(manpower:String = "5v5") {
        for player in onIce {
            players[player].increaseIcingDrawn(manpower: manpower)
        }
    }
    
    // Added by Nick: needed to be able to populate drop-downs: the UIKit framework is annoying and can't handle set elements
    func updateCurrentIce(){
        // updates arrays currIce and currIceNames whenever the on-ice config changes
        
        // reset values
        currIce.removeAll()
        currIceNames.removeAll()
        labelString = ""
        
        // populate currIceNames with jersey numbers for now, will establish a proper string format down the line
        for player in onIce {
            currIce.append(players[player])
            labelString = "Player # \(String(players[player]._jerseyNumber))" //+ players[player]._lastName
            currIceNames.append(labelString)
        }
        
        // sort them by jersey number: fix later
        currIceNames.sort()
        currIceNames.append("Unknown")
        
    }
}


