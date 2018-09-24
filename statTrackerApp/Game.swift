//
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
    var onIce = Set<Player>()
    
    // players
    var _player1:Player
    var _player2:Player
    var _player3:Player
    var _player4:Player
    var _player5:Player
    var _player6:Player
    var _player7:Player
    var _player8:Player
    var _player9:Player
    var _player10:Player
    var _player11:Player
    var _player12:Player
    var _player13:Player
    var _player14:Player
    var _player15:Player
    var _player16:Player
    var _player17:Player
    var _player18:Player
    var _player19:Player
    var _player20:Player
    var _player21:Player
    var _player22:Player
    
    // hard-coding game
    init(player1:Player, player2:Player, player3:Player, player4:Player, player5:Player, player6:Player, player7:Player, player8:Player, player9:Player, player10:Player, player11:Player, player12:Player, player13:Player, player14:Player, player15:Player, player16:Player, player17:Player, player18:Player, player19:Player, player20:Player, player21:Player, player22:Player){
        _player1 = player1
        _player2 = player2
        _player3 = player3
        _player4 = player4
        _player5 = player5
        _player6 = player6
        _player7 = player7
        _player8 = player8
        _player9 = player9
        _player10 = player10
        _player11 = player11
        _player12 = player12
        _player13 = player13
        _player14 = player14
        _player15 = player15
        _player16 = player16
        _player17 = player17
        _player18 = player18
        _player19 = player19
        _player20 = player20
        _player21 = player21
        _player22 = player22
    }
    
    
    // managing ice
    func iceIsFull() -> Bool {
        return onIce.count == 5
    }
    
    func putOnIce(addPlayer:Player) {
        if !iceIsFull() {
            onIce.insert(addPlayer)
            addPlayer.enablePlayer()
        }
    }
    
    func takeOffIce(removePlayer:Player) {
        onIce.remove(removePlayer)
        removePlayer.disablePlayer()
    }
    
    
    // stat buttons
    func shotFor() {
        for player in onIce {
            player.increaseShotFor()
        }
    }
    
    func shotAgainst() {
        for player in onIce {
            player.increaseShotAgainst()
        }
    }
    
    func goalFor() {
        for player in onIce {
            player.increaseGoalFor()
        }
    }
    
    func goalAgainst() {
        for player in onIce {
            player.increaseGoalAgainst()
        }
    }
    
    func penalty(player:Player) {
        if player.isEnabled() {
            player.increasePenalty()
        }
    }
    
}


