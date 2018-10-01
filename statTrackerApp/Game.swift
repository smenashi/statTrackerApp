//
//  game.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/23/18.
//  Copyright © 2//
//  Game.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/23/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation

class Game {
    var _season = "2018"
    var _gameId = 0
    var onIce = Set<Int>()
    
    // players
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
        
    }
    
    func takeOffIce(removePlayer:Player) {
        onIce.remove(players.firstIndex(of: removePlayer) ?? -1)
        removePlayer.disablePlayer()
        removePlayer.stopClock()
    }
    
    func getIce() -> Set<Int> {
        return onIce
    }
    
    func getPlayer(number:Int) -> Player {
        return players[number]
    }
    
    // stat buttons
    func shotFor() {
        for player in onIce {
            players[player].increaseShotFor()
        }
    }
    
    func shotAgainst() {
        for player in onIce {
            players[player].increaseShotAgainst()
        }
    }
    
    func goalFor() {
        for player in onIce {
            players[player].increaseGoalFor()
        }
    }
    
    func goalAgainst() {
        for player in onIce {
            players[player].increaseGoalAgainst()
        }
    }
    
    func penalty(player:Player) {
        if player.isEnabled() {
            player.increasePenalty()
        }
    }
    
}


