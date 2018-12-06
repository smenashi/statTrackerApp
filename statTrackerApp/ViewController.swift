//
//  ViewController.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/11/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    //this is for database access
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var playerButtonColor = UIColor(red: 0.83921569, green: 0.72941176, blue: 0.54509804, alpha: 1.0)
    
    var game:Game!
    // hard-coding game
    //    var game = Game(player1: Player(firstName: "none", lastName: "9", jerseyNum: 9), player2: Player(firstName: "none", lastName: "15", jerseyNum: 15), player3: Player(firstName: "none", lastName: "18", jerseyNum: 18), player4: Player(firstName: "none", lastName: "16", jerseyNum: 16), player5: Player(firstName: "none", lastName: "10", jerseyNum: 10), player6: Player(firstName: "none", lastName: "26", jerseyNum: 26), player7: Player(firstName: "none", lastName: "22", jerseyNum: 22), player8: Player(firstName: "none", lastName: "20", jerseyNum: 20), player9: Player(firstName: "none", lastName: "12", jerseyNum: 12), player10: Player(firstName: "none", lastName: "27", jerseyNum: 27), player11: Player(firstName: "none", lastName: "23", jerseyNum: 23), player12: Player(firstName: "none", lastName: "19", jerseyNum: 19), player13: Player(firstName: "none", lastName: "5", jerseyNum: 5), player14: Player(firstName: "none", lastName: "4", jerseyNum: 4), player15: Player(firstName: "none", lastName: "44", jerseyNum: 44), player16: Player(firstName: "none", lastName: "14", jerseyNum: 14), player17: Player(firstName: "none", lastName: "7", jerseyNum: 7), player18: Player(firstName: "none", lastName: "2", jerseyNum: 2), player19: Player(firstName: "none", lastName: "29", jerseyNum: 29), player20: Player(firstName: "none", lastName: "34", jerseyNum: 34), player21: Player(firstName: "none", lastName: "1", jerseyNum: 1), player22: Player(firstName: "none", lastName: "6", jerseyNum: 6))
    
    var _manpower: [Int] = [5, 5]
    
    func manpowerStr() -> String {
        let man1 = String(_manpower[0])
        let man2 = String(_manpower[1])
        return man1 + "v" + man2
    }
    var hamBox:[Player] = []
    var awayBox: [Player] = []
    var enableManpower = false
    
    @IBOutlet weak var displayCount: UILabel!
    
    
    // OUTLETS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // this contains all the outlets to all the buttons on-screen
    // organized by category for quick use and reference with
    // any functionality that is needed down the line
    
    // Game input from main menu screen
    var inputCollegeText: String?
    
    @IBOutlet weak var testInputLabel: UILabel!
    
    
    //Blue header for game screen
    @IBOutlet weak var blueHeader: UIView!
    // Penalty boxes
    @IBOutlet weak var hamPenaltyBox: UIImageView!
    @IBOutlet weak var opponentPenaltyBox: UIImageView!
    
    // Game Clock and Time //////////////////
    @IBOutlet weak var gameClock: UIButton!
    @IBOutlet weak var gameTime: UILabel!
    /////////////////////////////////////////
    
    // Period button
    @IBOutlet weak var endPeriodButton: UIButton!
    
    // Period Labels //////////////////
    @IBOutlet weak var period1Label: UILabel!
    @IBOutlet weak var period2Label: UILabel!
    @IBOutlet weak var period3Label: UILabel!
    @IBOutlet weak var otLabel: UILabel!
    /////////////////////////////////////////
    // Period Labels array
    var periodLabels = Array<UILabel>()
    // Current Period
    var currPeriod = 0
    
    // Man Power Configurations Buttons /////
    @IBOutlet weak var manPow5v5: UIButton!
    @IBOutlet weak var manPow5v4: UIButton!
    @IBOutlet weak var manPow5v3: UIButton!
    @IBOutlet weak var manPow4v5: UIButton!
    @IBOutlet weak var manPow4v4: UIButton!
    @IBOutlet weak var manPow4v3: UIButton!
    @IBOutlet weak var manPow3v5: UIButton!
    @IBOutlet weak var manPow3v4: UIButton!
    @IBOutlet weak var manPow3v3: UIButton!
    /////////////////////////////////////////
    // Manpower buttons array
    var manPowerAlphas = Array<UIButton>()
    // Default config
    var  currConfig = 0
    
    // Player buttons ///////////////////////
    @IBOutlet weak var Player1: UIButton!
    @IBOutlet weak var Player2: UIButton!
    @IBOutlet weak var Player3: UIButton!
    @IBOutlet weak var Player4: UIButton!
    @IBOutlet weak var Player5: UIButton!
    @IBOutlet weak var Player6: UIButton!
    @IBOutlet weak var Player7: UIButton!
    @IBOutlet weak var Player8: UIButton!
    @IBOutlet weak var Player9: UIButton!
    @IBOutlet weak var Player10: UIButton!
    @IBOutlet weak var Player11: UIButton!
    @IBOutlet weak var Player12: UIButton!
    @IBOutlet weak var Player13: UIButton!
    @IBOutlet weak var Player14: UIButton!
    @IBOutlet weak var Player15: UIButton!
    @IBOutlet weak var Player16: UIButton!
    @IBOutlet weak var Player17: UIButton!
    @IBOutlet weak var Player18: UIButton!
    @IBOutlet weak var Player19: UIButton!
    @IBOutlet weak var Player20: UIButton!
    @IBOutlet weak var Player21: UIButton!
    @IBOutlet weak var Player22: UIButton!
    
    lazy var playerButtons = [Player1, Player2, Player3, Player4, Player5, Player6, Player7, Player8, Player9, Player10, Player11, Player12, Player13, Player14, Player15, Player16, Player17, Player18, Player19, Player20, Player21, Player22]
    
    /////////////////////////////////////////
    
    // Line buttons /////////////////////////
    @IBOutlet weak var f1: UIButton!
    @IBOutlet weak var f2: UIButton!
    @IBOutlet weak var f3: UIButton!
    @IBOutlet weak var f4: UIButton!
    @IBOutlet weak var d1: UIButton!
    @IBOutlet weak var d2: UIButton!
    @IBOutlet weak var d3: UIButton!
    /////////////////////////////////////////
    
    // Event buttons ////////////////////////
    @IBOutlet weak var shotForButton: UIButton!
    @IBOutlet weak var shotAgainstButton: UIButton!
    @IBOutlet weak var goalForButton: UIButton!
    @IBOutlet weak var goalAgainstButton: UIButton!
    @IBOutlet weak var icingForButton: UIButton!
    @IBOutlet weak var icingAgainstButton: UIButton!
    
    
    
    /////////////////////////////////////////
    func init_roster(){
        let playerArray = appDelegate.database?.getCurrentRoster() ?? []
        var tempRoster = Array(repeating: Player(firstName: "Empty", lastName: "Empty", jerseyNum: 0), count: 22)
        for player in playerArray{
            if player.position != 0{
                tempRoster[player.position - 1] = Player(firstName: player.firstName, lastName: player.lastName, jerseyNum: player.number)
            }
        }
        tempRoster[0].playerButton = Player1
        tempRoster[1].playerButton = Player2
        tempRoster[2].playerButton = Player3
        tempRoster[3].playerButton = Player4
        tempRoster[4].playerButton = Player5
        tempRoster[5].playerButton = Player6
        tempRoster[6].playerButton = Player7
        tempRoster[7].playerButton = Player8
        tempRoster[8].playerButton = Player9
        tempRoster[9].playerButton = Player10
        tempRoster[10].playerButton = Player11
        tempRoster[11].playerButton = Player12
        tempRoster[12].playerButton = Player13
        tempRoster[13].playerButton = Player14
        tempRoster[14].playerButton = Player15
        tempRoster[15].playerButton = Player16
        tempRoster[16].playerButton = Player17
        tempRoster[17].playerButton = Player18
        tempRoster[18].playerButton = Player19
        tempRoster[19].playerButton = Player20
        tempRoster[20].playerButton = Player21
        tempRoster[21].playerButton = Player22
        
        game = Game(player1: tempRoster[0], player2: tempRoster[1], player3: tempRoster[2], player4: tempRoster[3], player5: tempRoster[4], player6: tempRoster[5], player7: tempRoster[6], player8: tempRoster[7], player9: tempRoster[8], player10: tempRoster[9], player11: tempRoster[10], player12: tempRoster[11], player13: tempRoster[12], player14: tempRoster[13], player15: tempRoster[14], player16: tempRoster[15], player17: tempRoster[16], player18: tempRoster[17], player19: tempRoster[18], player20: tempRoster[19], player21: tempRoster[20], player22: tempRoster[21])
    }
    
    // OUTLETS END !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    // FUNC BUTTONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // this section contains all the functions linked to all the buttons
    // that have some functionality linked to them for quick reference
    // and use down the line
    
    // Manpower Buttons: these are the function signatures for the manpower
    //                   buttons at the top of the screen
    //
    // Cosmetically:     - set clicked button <button>.alpha = 1
    //                   - set alpha of all other buttons to <button_i> = 0.5
    //
    // Logically:        - change current manpower configuration in record
    // --------------------------------------------------------------------
    @IBAction func click5v5(_ sender: Any) {
        // manpower button 5v5 is clicked: change current manpower config to 5v5
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow5v5.alpha = 1
            currConfig = 0
        }
        
    }
    @IBAction func click5v4(_ sender: Any) {
        // manpower button 5v4 is clicked: change current manpower config to 5v4
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow5v4.alpha = 1
            currConfig = 1
        }
    }
    @IBAction func click5v3(_ sender: Any) {
        // manpower button 5v3 is clicked: change current manpower config to 5v3
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow5v3.alpha = 1
            currConfig = 2
        }
    }
    @IBAction func click4v5(_ sender: Any) {
        // manpower button 4v5 is clicked: change current manpower config to 4v5
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow4v5.alpha = 1
            currConfig = 3
        }
    }
    
    @IBAction func click4v4(_ sender: Any) {
        // manpower button 4v4 is clicked: change current manpower config to 4v4
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow4v4.alpha = 1
            currConfig = 4
        }
    }
    
    @IBAction func click4v3(_ sender: Any) {
        // manpower button 4v3 is clicked: change current manpower config to 4v3
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow4v3.alpha = 1
            currConfig = 5
        }
    }
    
    @IBAction func click3v5(_ sender: Any) {
        // manpower button 3v5 is clicked: change current manpower config to 3v5
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow3v5.alpha = 1
            currConfig = 6
        }
    }
    @IBAction func click3v4(_ sender: Any) {
        // manpower button 3v4 is clicked: change current manpower config to 3v4
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow3v4.alpha = 1
            currConfig = 7
        }
    }
    @IBAction func click3v3(_ sender: Any) {
        // manpower button 3v3 is clicked: change current manpower config to 3v3
        if enableManpower {
            manPowerAlphas[currConfig].alpha = 0.25
            manPow3v3.alpha = 1
            currConfig = 8
        }
    }
    
    
    func manpowerSwitch() {
        enableManpower = true
        if _manpower == [5, 5] {
            click5v5((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [5, 4] {
            click5v4((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [5, 3] {
            click5v3((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [4, 5] {
            click4v5((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [4, 4] {
            click4v4((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [4, 3] {
            click4v3((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [3, 5] {
            click3v5((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [3, 4] {
            click3v4((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        } else if _manpower == [3, 3] {
            click3v3((Any).self)
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        }
        enableManpower = false
    }
    
    func manpowerUsPressedSwitch() {
        if _manpower[0] > 3 {
            _manpower[0] = _manpower[0] - 1
            manpowerSwitch()
        }
    }
    
    func manpowerUsReleasedSwitch() {
        if _manpower[0] > 2 {
            _manpower[0] = _manpower[0] + 1
            manpowerSwitch()
        }
    }
    
    func manpowerThemPressedSwitch() {
        if _manpower[1] > 3 {
            _manpower[1] = _manpower[1] - 1
            manpowerSwitch()
        }
    }
    
    func manpowerThemReleasedSwitch() {
        if _manpower[1] > 2 {
            _manpower[1] = _manpower[1] + 1
            manpowerSwitch()
        }
    }
    
    // function for delaying manpower switching
    // <script src=https://iosrevisited.blogspot.com/2017/08/dispatchafter-gcd-in-swift-swift-3.html></script>
    func delayManpowerSwitch(_ time:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    // -------------------------------------------------------------------------------
    // Player Buttons:  these are the function signatures for the player buttons
    //                  on the LHS of the screen.
    //
    // Cosmetically:    - players that are on: <Player_i>.backgroundColor = .green
    //                  (for now), when deselected, their color returns to
    //                  R: 214 G: 186 B: 139 (for now)
    //                  - players will have last names and jersey #'s implemented
    //                      later down the line
    //
    // Logically:       - can have max 6 players on ice:
    //                      1 goalie, (typically) 3 forwards, 2 defenders
    //                  - clicking any player button puts them on ice,
    //                  - need to check if max number (by situation, i.e. penalty)
    //                  are on ice, if so, have to deselect at least one to select
    //                  another: the real logic will be more rigorous and specific,
    //                  but this is just as a note,
    //                  - players that are on have their stats stored in the record
    // ----------------------------------------------------------------------------
    @IBAction func clickPlayer1(_ sender: Any) {
        // Player1 is clicked
        let player = game.getPlayer(number: 0)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer2(_ sender: Any) {
        // Player2 is clicked
        let player = game.getPlayer(number: 1)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer3(_ sender: Any) {
        // Player3 is clicked
        let player = game.getPlayer(number: 2)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer4(_ sender: Any) {
        // Player4 is clicked
        let player = game.getPlayer(number: 3)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer5(_ sender: Any) {
        // Player5 is clicked
        let player = game.getPlayer(number: 4)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer6(_ sender: Any) {
        // Player6 is clicked
        let player = game.getPlayer(number: 5)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer7(_ sender: Any) {
        // Player7 is clicked
        let player = game.getPlayer(number: 6)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer8(_ sender: Any) {
        // Player8 is clicked
        let player = game.getPlayer(number: 7)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer9(_ sender: Any) {
        // Player9 is clicked
        let player = game.getPlayer(number: 8)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer10(_ sender: Any) {
        // Player10 is clicked
        let player = game.getPlayer(number: 9)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer11(_ sender: Any) {
        // Player11 is clicked
        let player = game.getPlayer(number: 10)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer12(_ sender: Any) {
        // Player12 is clicked
        let player = game.getPlayer(number: 11)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer13(_ sender: Any) {
        // Player13 is clicked
        let player = game.getPlayer(number: 12)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer14(_ sender: Any) {
        // Player14 is clicked
        let player = game.getPlayer(number: 13)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer15(_ sender: Any) {
        // Player15 is clicked
        let player = game.getPlayer(number: 14)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer16(_ sender: Any) {
        // Player16 is clicked
        let player = game.getPlayer(number: 15)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer17(_ sender: Any) {
        // Player17 is clicked
        let player = game.getPlayer(number: 16)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer18(_ sender: Any) {
        // Player18 is clicked
        let player = game.getPlayer(number: 17)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer19(_ sender: Any) {
        // Player19 is clicked
        let player = game.getPlayer(number: 18)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer20(_ sender: Any) {
        // Player20 is clicked
        let player = game.getPlayer(number: 19)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer21(_ sender: Any) {
        // Player21 is clicked
        let player = game.getPlayer(number: 20)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    @IBAction func clickPlayer22(_ sender: Any) {
        // Player22 is clicked
        let player = game.getPlayer(number: 21)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player, manpower:_manpower)
            }
        }
    }
    
    
    // -------------------------------------------------------------------------------
    // Event buttons:   these are (for now)
    //                      - Shot For
    //                      - Shot Against
    //                      - Goal For
    //                      - Goal Against
    //                      - Penalties
    //                      - Icing
    //
    // Cosmetically:    - Shot For, Goal For, Penalties, Penalties Drawn, and Icing have drop-down menus attached to them
    //                  - these drop-down menus close either when the button is
    //                      pressed or when a cell is clicked
    //
    // Logically:       - Shot For, Goal For:
    //                      - when pressed, the drop down menu is populated with
    //                          all players currently on the ice, once pressed
    //                          that player gets +1 to their relevant stat
    //                      - when the cell of the player is clicked
    //                          (important to avoid the case when someone accidentally
    //                          presses the Shot For / Goal For button)
    //                          all players on the ice also get +1 to their
    //                          relevant stat
    //
    //                  - Shot Against, Goal Against:
    //                      - update relevant stats to the current players on ice
    //                          and any other relevant stats to the record
    //                  - Penalties:
    //                      - (not implemented yet) choose for/against, update stats
    //                          accordingly
    // -------------------------------------------------------------------------------
    
    // this will come in handy for determining what stat the drop down menu corresponds to
    var dropDownClicked = ""
    
    @IBAction func onClickShotForButton(_ sender: Any) {
        // Shot For button clicked: update relevant stats to the players on ice, along with other stats
        // animations for drop-down menu ---------------
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "shotFor" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = shotForButton.frame.minX
        let newY = shotForButton.frame.maxY
        
        if playersDropDown.isHidden{
            //update x and y coords
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // update statistics
        game.shotFor(manpower: _manpower)
    }
    
    @IBAction func onClickShotAgainst(_ sender: Any) {
        // shot against clicked: update relevant stats to players on ice,
        //                       and any other stats
        
        game.shotAgainst(manpower: _manpower)
        let onIceNumbers = game.getOnIceNumbersAsArray()
        appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "shotAgainst", manpower: manpowerStr(), statOwnerNum: 0, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
        
    }
    
    
    @IBAction func onClickGoalForButton(_ sender: Any) {
        // Goal For button clicked: update relevant stats to current players on ice
        // ref:
        // https://www.youtube.com/watch?v=b1LiBiLjca4&index=13&list=PLWVdXdO5KDTwyK5ic9OYI49_EpkEP4v8M&t=0s
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "goalFor" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = goalForButton.frame.minX
        let newY = goalForButton.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // : increase the SHOT and GOAL for for each player on ice here
        game.shotFor()
        game.goalFor(manpower: _manpower)
        if usPQ.count > 0 {
            usPQ.removeClock()
        }
        if themPQ.count > 0 {
            themPQ.removeClock()
        }
        
    }
    
    @IBAction func onClickGoalAgainst(_ sender: Any) {
        // Goal Against button clicked: update relevant stats to players on ice
        //                              and any other stats
        game.goalAgainst()
        if usPQ.count > 0 {
            usPQ.removeClock()
        }
        if themPQ.count > 0 {
            themPQ.removeClock()
        }
        
        let onIceNumbers = game.getOnIceNumbersAsArray()
        appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "goalAgainst", manpower: manpowerStr(), statOwnerNum: 0, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
    }
    
    @IBAction func onClickIcingFor(_ sender: Any) {
        // Icing For button clicked: update relevant stats to players on ice
        //  has drop-down for selecting player
        
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "icing" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = icingForButton.frame.minX
        let newY = icingForButton.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // : increase the ICING for each player on ice here
        game.icing(manpower: _manpower)
        
        
    }
    
    
    @IBAction func onClickIcingAgainst(_ sender: Any) {
        // Icing Against button clicked: update relevant stats to players on ice
        game.icingDrawn(manpower: _manpower)
        
        let onIceNumbers = game.getOnIceNumbersAsArray()
        appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "IcingDrawn", manpower: manpowerStr(), statOwnerNum: 0, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
    }
    
    
    // Penalty Buttons:
    // ----------------------------------------------
    // <Min> For: -------------------
    
    
    @IBOutlet weak var penalty2ForButton: UIButton!
    
    @IBAction func penalty2ForClicked(_ sender: Any) {
        // 2:00 For clicked: update relevant stats to players on ice
        //  has drop-down for selecting player

        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "2Us" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty2ForButton.frame.minX
        let newY = penalty2ForButton.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
            
        
    }
    
    @IBOutlet weak var penalty4ForButton: UIButton!
    @IBAction func penalty4ForClicked(_ sender: Any) {
        // 4:00 For clicked: update relevant stats to players on ice
        //  has drop-down for selecting player
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "4Us" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty4ForButton.frame.minX
        let newY = penalty4ForButton.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
    }
    
    @IBOutlet weak var penalty5ForButton: UIButton!
    @IBAction func penalty5ForClicked(_ sender: Any) {
        // 5:00 For clicked: update relevant stats to players on ice
        //  has drop-down for selecting player
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "5Us" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty5ForButton.frame.minX
        let newY = penalty5ForButton.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
    }
    
    // <Min> Against: ---------------
    
    @IBOutlet weak var penalty2Against: UIButton!
    @IBAction func penalty2AgainstClicked(_ sender: Any) {

        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "2Them" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty2Against.frame.minX
        let newY = penalty2Against.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
    }
    
    @IBOutlet weak var penalty4Against: UIButton!
    @IBAction func penalty4AgainstClicked(_ sender: Any) {
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "4Them" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty4Against.frame.minX
        let newY = penalty4Against.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
    }
    
    
    @IBOutlet weak var penalty5Against: UIButton!
    @IBAction func penalty5AgainstClicked(_ sender: Any) {
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "5Them" // mark which dropDown was clicked
        // get new X & Y positions for the drop-down menu
        let newX = penalty5Against.frame.minX
        let newY = penalty5Against.frame.maxY
        
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
    }
    
    // ----------------------------------------------
    
    // Penalty Boxes: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Outlets: reference these objects to modify their text accordingly
    // jersey number labels
    @IBOutlet weak var jerseynum1: UILabel!
    @IBOutlet weak var jerseynum2: UILabel!
    @IBOutlet weak var jerseynum3: UILabel!
    @IBOutlet weak var jerseynum4: UILabel!
    
    
    // timer labels
    @IBOutlet weak var timer1: UILabel!
    @IBOutlet weak var timer2: UILabel!
    @IBOutlet weak var timer3: UILabel!
    @IBOutlet weak var timer4: UILabel!
    
    lazy var usPQ = PenaltyQueue(gameTimer: gameTimer, pbox1: jerseynum1, pbox2: jerseynum2, timerLabel1: timer1, timerLabel2: timer2, mP: manpowerUsPressedSwitch, mR: manpowerUsReleasedSwitch, _game:game)
    lazy var themPQ = PenaltyQueue(gameTimer: gameTimer, pbox1: jerseynum3, pbox2: jerseynum4, timerLabel1: timer3, timerLabel2: timer4, mP: manpowerThemPressedSwitch, mR: manpowerThemReleasedSwitch, _game:game)


    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    
    
    
    // -------------------------------------------------------------------------------
    // Line Buttons
    //      the 7 line buttons on the left hand side
    //
    // Cosmetically: nothing happens
    //
    // Logically:    - If any F_n button is pressed: disengage 3 players in F category,
    //                  put the players on that line on
    //               - If any D_n button is pressed: disengage 2 players in D category,
    //                  put hte players on that line on
    //
    // Note:        having more than 3F or 2D players is rare and managing them will
    //              be done by hand
    // -------------------------------------------------------------------------------
    
    @IBAction func clickF1(_ sender: Any) {
        // F1 line button clicked:  disengage 3 players from F, put F1 players on
        let ice = game.getIce()
        let f1 = [0, 1, 2]
        for player in ice {
            if player < 12 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for forward in f1 {
            game.putOnIce(addPlayer: game.getPlayer(number: forward), manpower: _manpower)
        }
    }
    
    @IBAction func clickF2(_ sender: Any) {
        // F2 line button clicked:  disengage 3 players from F, put F2 players on
        let ice = game.getIce()
        let f2 = [3, 4, 5]
        for player in ice {
            if player < 12 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for forward in f2 {
            game.putOnIce(addPlayer: game.getPlayer(number: forward), manpower: _manpower)
        }
    }
    
    @IBAction func clickF3(_ sender: Any) {
        // F3 line button clicked:  disengage 3 players from F, put F3 players on
        let ice = game.getIce()
        let f3 = [6, 7, 8]
        for player in ice {
            if player < 12 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for forward in f3 {
            game.putOnIce(addPlayer: game.getPlayer(number: forward), manpower: _manpower)
        }
    }
    
    @IBAction func clickF4(_ sender: Any) {
        // F4 line button clicked:  disengage 3 players from F, put F4 players on
        let ice = game.getIce()
        let f4 = [9, 10, 11]
        for player in ice {
            if player < 12 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for forward in f4 {
            game.putOnIce(addPlayer: game.getPlayer(number: forward), manpower: _manpower)
        }
    }
    
    @IBAction func clickD1(_ sender: Any) {
        // D1 line button clicked:  disengage 2 players from D, put D1 players on
        let ice = game.getIce()
        let d1 = [12, 13]
        for player in ice {
            if player > 11 && player < 18 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for defender in d1 {
            game.putOnIce(addPlayer: game.getPlayer(number: defender), manpower: _manpower)
        }
    }
    
    @IBAction func clickD2(_ sender: Any) {
        // D2 line button clicked:  disengage 2 players from D, put D2 players on
        let ice = game.getIce()
        let d2 = [14, 15]
        for player in ice {
            if player > 11 && player < 18 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for defender in d2 {
            game.putOnIce(addPlayer: game.getPlayer(number: defender), manpower: _manpower)
        }
    }
    
    @IBAction func clickD3(_ sender: Any) {
        // D3 line button clicked:  disengage 2 players from D, put D3 players on
        let ice = game.getIce()
        let d3 = [16, 17]
        for player in ice {
            if player > 11 && player < 18 {
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
            }
        }
        for defender in d3 {
            game.putOnIce(addPlayer: game.getPlayer(number: defender), manpower: _manpower)
        }
    }
    
    
    // -------------------------------------------------------------------------------
    // Game Clock Button: this starts/stops the countdown timer for the game
    // ref: https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
    
    /*
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
     */
    // initialize GameClock instance
    var gameTimer = GameClock()
    
    // clock labels: change based on state
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var stopLabel: UILabel!
    
    
    @IBAction func onClickGameClock(_ sender: Any) {
        // CLOCK button clicked:
        playersDropDown.reloadData() // reload drop-down data
        if gameTimer.clockOnFlag {
            gameTimer.stopGameClock()
            
            stopLabel.alpha = 0.4
            startLabel.alpha = 1
            for player in game.getIce() {
                game.getPlayer(number: player).stopClock()
            }
        }
            
        else {
            // pauses the clock and changes boolean value
            gameTimer.startGameClock(timerLabel: gameTime)
            stopLabel.alpha = 1
            startLabel.alpha = 0.4
            for player in game.getIce() {
                game.getPlayer(number: player).startClock(manpower: _manpower)
            }
        }
    }
    
    
    // -------------------------------------------------------------------------------
    // End Period Button:   ends the period, resets timer
    //
    // Cosmetically:        - change .alpha of Period Buttons appropriately
    //
    // Logically:           - reset timer
    //                      - update stats accordingly
    // -------------------------------------------------------------------------------
    @IBAction func onClickEndPeriod(_ sender: Any) {
        // resets timer to 00:20:00
        playersDropDown.reloadData() // reload drop-down data
        gameTimer.stopGameClock()
        gameTimer.endPeriod()
        gameTimer.startNewPeriod(timerLabel: gameTime)
        
        // change alphas of period labels
        if currPeriod != 3{
            periodLabels[currPeriod].alpha = 0.2
            currPeriod += 1
            periodLabels[currPeriod].alpha = 1
        }
        // change alphas of game clock labels:
        startLabel.alpha = 1
        stopLabel.alpha = 0.4
        
        // execute relevant stat-related logic for end of period here
    }
    
    // -------------------------------------------------------------------------------
    // End Game Button: this ends the game
    @IBAction func onClickEndGame(_ sender: Any) {
        // using this button to stop timer for now //
        gameTimer.stopGameClock()
        gameTimer.endGame(timerLabel: gameTime)
        playersDropDown.reloadData() // reload drop-down data
        //        print("These are all the players on ice: ")
        
        for player in game.getIce() {
            game.getPlayer(number: player).stopClock()
            
            //            print(game.getPlayer(number: player)._jerseyNumber)
            //            print(game.getPlayer(number: player)._lastName)
            
        }
        var sql:String
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        for player in game.getAllPlayers() {
            //replace when DB already works (for now temp fix)
            let FiveFiveIceTime = Int(player.iceTime["5v5"] ?? 0)
            let FiveFourIceTime = Int(player.iceTime["5v4"] ?? 0)
            let FourFiveIceTime = Int(player.iceTime["4v5"] ?? 0)
            let FiveThreeIceTime = Int(player.iceTime["5v3"] ?? 0)
            let ThreeFiveIceTime = Int(player.iceTime["3v5"] ?? 0)
            let FourFourIceTime = Int(player.iceTime["4v4"] ?? 0)
            let FourThreeIceTime = Int(player.iceTime["4v3"] ?? 0)
            let ThreeFourIceTime = Int(player.iceTime["3v4"] ?? 0)
            let ThreeThreeIceTime = Int(player.iceTime["3v3"] ?? 0)
            let totIceTime = FiveFiveIceTime + FiveFourIceTime + FourFiveIceTime + FiveThreeIceTime + ThreeFiveIceTime + FourFourIceTime + FourThreeIceTime + ThreeFourIceTime + ThreeThreeIceTime
            let FiveFiveShots = (player.shotForTaken["5v5"] ?? 0)
            let FiveFourShots = (player.shotForTaken["5v4"] ?? 0)
            let FourFiveShots = (player.shotForTaken["4v5"] ?? 0)
            let FiveThreeShots = (player.shotForTaken["5v3"] ?? 0)
            let ThreeFiveShots = (player.shotForTaken["3v5"] ?? 0)
            let FourFourShots = (player.shotForTaken["4v4"] ?? 0)
            let ThreeFourShots = (player.shotForTaken["3v4"] ?? 0)
            let FourThreeShots = (player.shotForTaken["4v3"] ?? 0)
            let ThreeThreeShots = (player.shotForTaken["3v3"] ?? 0)
            let totShots = FiveFiveShots + FiveFourShots + FourFiveShots + FiveThreeShots + ThreeFiveShots + FourFourShots + FourThreeShots + ThreeFourShots + ThreeThreeShots
            let FiveFiveGoals = (player.goalForTaken["5v5"] ?? 0)
            let FiveFourGoals = (player.goalForTaken["5v4"] ?? 0)
            let FourFiveGoals = (player.goalForTaken["4v5"] ?? 0)
            let FiveThreeGoals = (player.goalForTaken["5v3"] ?? 0)
            let ThreeFiveGoals = (player.goalForTaken["3v5"] ?? 0)
            let FourFourGoals = (player.goalForTaken["4v4"] ?? 0)
            let FourThreeGoals = (player.goalForTaken["4v3"] ?? 0)
            let ThreeFourGoals = (player.goalForTaken["3v4"] ?? 0)
            let ThreeThreeGoals = (player.goalForTaken["3v3"] ?? 0)
            let totGoals = FiveFiveGoals + FiveFourGoals + FourFiveGoals + FiveThreeGoals + ThreeFiveGoals + FourFourGoals + FourThreeGoals + ThreeFourGoals + ThreeThreeGoals
            let FiveFivePIMC = ((player.penalty2min["5v5"]!) * 2) + ((player.penalty4min["5v5"]!) * 4) + ((player.penalty5min["5v5"]!) * 5)
            let FiveFourPIMC = ((player.penalty2min["5v4"]!) * 2) + ((player.penalty4min["5v4"]!) * 4) + ((player.penalty5min["5v4"]!) * 5)
            let FourFivePIMC = ((player.penalty2min["4v5"]!) * 2) + ((player.penalty4min["4v5"]!) * 4) + ((player.penalty5min["4v5"]!) * 5)
            let FiveThreePIMC = ((player.penalty2min["5v3"]!) * 2) + ((player.penalty4min["5v3"]!) * 4) + ((player.penalty5min["5v3"]!) * 5)
            let ThreeFivePIMC = ((player.penalty2min["3v5"]!) * 2) + ((player.penalty4min["3v5"]!) * 4) + ((player.penalty5min["3v5"]!) * 5)
            let FourFourPIMC = ((player.penalty2min["4v4"]!) * 2) + ((player.penalty4min["4v4"]!) * 4) + ((player.penalty5min["4v4"]!) * 5)
            let FourThreePIMC = ((player.penalty2min["4v3"]!) * 2) + ((player.penalty4min["4v3"]!) * 4) + ((player.penalty5min["4v3"]!) * 5)
            let ThreeFourPIMC = ((player.penalty2min["3v4"]!) * 2) + ((player.penalty4min["3v4"]!) * 4) + ((player.penalty5min["3v4"]!) * 5)
            let ThreeThreePIMC = ((player.penalty2min["3v3"]!) * 2) + ((player.penalty4min["3v3"]!) * 4) + ((player.penalty5min["3v3"]!) * 5)
            
            let FiveFivePIMD = ((player.penaltyDrawn2min["5v5"]!) * 2) + ((player.penaltyDrawn4min["5v5"]!) * 4) + ((player.penaltyDrawn5min["5v5"]!) * 5)
            let FiveFourPIMD = ((player.penaltyDrawn2min["5v4"]!) * 2) + ((player.penaltyDrawn4min["5v4"]!) * 4) + ((player.penaltyDrawn5min["5v4"]!) * 5)
            let FourFivePIMD = ((player.penaltyDrawn2min["4v5"]!) * 2) + ((player.penaltyDrawn4min["4v5"]!) * 4) + ((player.penaltyDrawn5min["4v5"]!) * 5)
            let FiveThreePIMD = ((player.penaltyDrawn2min["5v3"]!) * 2) + ((player.penaltyDrawn4min["5v3"]!) * 4) + ((player.penaltyDrawn5min["5v3"]!) * 5)
            let ThreeFivePIMD = ((player.penaltyDrawn2min["3v5"]!) * 2) + ((player.penaltyDrawn4min["3v5"]!) * 4) + ((player.penaltyDrawn5min["3v5"]!) * 5)
            let FourFourPIMD = ((player.penaltyDrawn2min["4v4"]!) * 2) + ((player.penaltyDrawn4min["4v4"]!) * 4) + ((player.penaltyDrawn5min["4v4"]!) * 5)
            let FourThreePIMD = ((player.penaltyDrawn2min["4v3"]!) * 2) + ((player.penaltyDrawn4min["4v3"]!) * 4) + ((player.penaltyDrawn5min["4v3"]!) * 5)
            let ThreeFourPIMD = ((player.penaltyDrawn2min["3v4"]!) * 2) + ((player.penaltyDrawn4min["3v4"]!) * 4) + ((player.penaltyDrawn5min["3v4"]!) * 5)
            let ThreeThreePIMD = ((player.penaltyDrawn2min["3v3"]!) * 2) + ((player.penaltyDrawn4min["3v3"]!) * 4) + ((player.penaltyDrawn5min["3v3"]!) * 5)
            var totPIMMinus = 0.0
            var totPIMPlus = 0.0
            var totPIMPlusMinus = 0.0
            var FiveFiveCorsiPlus = 0.0
            var FiveFiveCorsiMinus = 0.0
            var FiveFiveCorsiPlusMinus = 0.0
            var FiveFiveIndivShotCorsi = 0.0
            var FiveFiveIcingPlusCorsi = 0.0
            var FiveFiveIcingMinusCorsi = 0.0
            var FiveFiveIcingPlusMinusCorsi = 0.0
            var FiveFiveIndivIcingCorsi = 0.0
            var FiveFourCorsiPlus = 0.0
            var FiveFourCorsiMinus = 0.0
            var FiveFourCorsiPlusMinus = 0.0
            var FourFiveCorsiPlus = 0.0
            var FourFiveCorsiMinus = 0.0
            var FourFiveCorsiPlusMinus = 0.0
            var FiveThreeCorsiPlus = 0.0
            var FiveThreeCorsiMinus = 0.0
            var FiveThreeCorsiPlusMinus = 0.0
            var ThreeFiveCorsiPlus = 0.0
            var ThreeFiveCorsiMinus = 0.0
            var ThreeFiveCorsiPlusMinus = 0.0
            var FourFourCorsiPlus = 0.0
            var FourFourCorsiMinus = 0.0
            var FourFourCorsiPlusMinus = 0.0
            var FourThreeCorsiPlus = 0.0
            var FourThreeCorsiMinus = 0.0
            var FourThreeCorsiPlusMinus = 0.0
            var ThreeFourCorsiPlus = 0.0
            var ThreeFourCorsiMinus = 0.0
            var ThreeFourCorsiPlusMinus = 0.0
            var ThreeThreeCorsiPlus = 0.0
            var ThreeThreeCorsiMinus = 0.0
            var ThreeThreeCorsiPlusMinus = 0.0
            if totIceTime != 0 {
                totPIMMinus = Float64(Float64(FiveFivePIMC + FiveFourPIMC + FourFivePIMC + FiveThreePIMC + ThreeFivePIMC + FourFourPIMC + FourThreePIMC + ThreeFourPIMC + ThreeThreePIMC)/Float64(totIceTime))
                //penalty minutes/(icetimeseconds/60)*60
                totPIMPlus = Float64(Float64(FiveFivePIMD + FiveFourPIMD + FourFivePIMD + FiveThreePIMD + ThreeFivePIMD + FourFourPIMD + FourThreePIMD + ThreeFourPIMD + ThreeThreePIMD)/Float64(totIceTime))
                totPIMPlusMinus = Float64(Float64(totPIMPlus) - Float64(totPIMMinus))/Float64(totIceTime)
                FiveFiveCorsiPlus = Float64(player.shotFor["5v5"]!)/Float64(totIceTime)
                FiveFiveCorsiMinus = Float64(player.shotAgainst["5v5"]!)/Float64(totIceTime)
                FiveFiveCorsiPlusMinus = Float64(Float64(player.shotFor["5v5"]!)-Float64(player.shotAgainst["5v5"]!))/Float64(totIceTime)
                FiveFiveIndivShotCorsi = Float64(player.shotForTaken["5v5"]!)/Float64(totIceTime)
                FiveFiveIcingPlusCorsi = Float64(player.icingDrawn["5v5"]!)/Float64(totIceTime)
                FiveFiveIcingMinusCorsi = Float64(player.icing["5v5"]!)/Float64(totIceTime)
                FiveFiveIcingPlusMinusCorsi = Float64(Float64(player.icingDrawn["5v5"]!) - Float64(player.icing["5v5"]!))/Float64(totIceTime)
                FiveFiveIndivIcingCorsi = Float64(player.icingByPlayer["5v5"]!)/Float64(totIceTime)
                
                FiveFourCorsiPlus = Float64(player.shotFor["5v4"]!)/Float64(totIceTime)
                FiveFourCorsiMinus = Float64(player.shotAgainst["5v4"]!)/Float64(totIceTime)
                FiveFourCorsiPlusMinus = Float64(Float64(player.shotFor["5v4"]!)-Float64(player.shotAgainst["5v4"]!))/Float64(totIceTime)
                
                FourFiveCorsiPlus = Float64(player.shotFor["4v5"]!)/Float64(totIceTime)
                FourFiveCorsiMinus = Float64(player.shotAgainst["4v5"]!)/Float64(totIceTime)
                FourFiveCorsiPlusMinus = Float64(Float64(player.shotFor["4v5"]!)-Float64(player.shotAgainst["4v5"]!))/Float64(totIceTime)
                
                FiveThreeCorsiPlus = Float64(player.shotFor["5v3"]!)/Float64(totIceTime)
                FiveThreeCorsiMinus = Float64(player.shotAgainst["5v3"]!)/Float64(totIceTime)
                FiveThreeCorsiPlusMinus = Float64(Float64(player.shotFor["5v3"]!)-Float64(player.shotAgainst["5v3"]!))/Float64(totIceTime)
                
                ThreeFiveCorsiPlus = Float64(player.shotFor["3v5"]!)/Float64(totIceTime)
                ThreeFiveCorsiMinus = Float64(player.shotAgainst["3v5"]!)/Float64(totIceTime)
                ThreeFiveCorsiPlusMinus = Float64(Float64(player.shotFor["3v5"]!)-Float64(player.shotAgainst["3v5"]!))/Float64(totIceTime)
                
                FourFourCorsiPlus = Float64(player.shotFor["4v4"]!)/Float64(totIceTime)
                FourFourCorsiMinus = Float64(player.shotAgainst["4v4"]!)/Float64(totIceTime)
                FourFourCorsiPlusMinus = Float64(Float64(player.shotFor["4v4"]!)-Float64(player.shotAgainst["4v4"]!))/Float64(totIceTime)
                
                FourThreeCorsiPlus = Float64(player.shotFor["4v3"]!)/Float64(totIceTime)
                FourThreeCorsiMinus = Float64(player.shotAgainst["4v3"]!)/Float64(totIceTime)
                FourThreeCorsiPlusMinus = Float64(Float64(player.shotFor["4v3"]!)-Float64(player.shotAgainst["4v3"]!))/Float64(totIceTime)
                
                ThreeFourCorsiPlus = Float64(player.shotFor["3v4"]!)/Float64(totIceTime)
                ThreeFourCorsiMinus = Float64(player.shotAgainst["3v4"]!)/Float64(totIceTime)
                ThreeFourCorsiPlusMinus = Float64(Float64(player.shotFor["3v4"]!)-Float64(player.shotAgainst["3v4"]!))/Float64(totIceTime)
                
                ThreeThreeCorsiPlus = Float64(player.shotFor["3v3"]!)/Float64(totIceTime)
                ThreeThreeCorsiMinus = Float64(player.shotAgainst["3v3"]!)/Float64(totIceTime)
                ThreeThreeCorsiPlusMinus = Float64(Float64(player.shotFor["3v3"]!)-Float64(player.shotAgainst["3v3"]!))/Float64(totIceTime)
            }
            sql = "replace into gameStats(game, firstName, lastName, number, totIceTime, totShots, totGoals, totPIMMinus, totPIMPlus, totPIMPlusMinus, FiveFiveCorsiPlus, FiveFiveCorsiMinus, FiveFiveCorsiPlusMinus, FiveFiveIndivShotsCorsi, FiveFiveIcingPlus, FiveFiveIcingMinus, FiveFiveIcingPlusMinus, FiveFiveIndivIcingCorsi, FiveFourCorsiPlus, FiveFourCorsiMinus, FiveFourCorsiPlusMinus, FourFiveCorsiPlus, FourFiveCorsiMinus, FourFiveCorsiPlusMinus, FourFourCorsiPlus, FourFourCorsiMinus, FourFourCorsiPlusMinus, FiveThreeCorsiPlus, FiveThreeCorsiMinus, FiveThreeCorsiPlusMinus, ThreeFiveCorsiPlus, ThreeFiveCorsiMinus, ThreeFiveCorsiPlusMinus, FourThreeCorsiPlus, FourThreeCorsiMinus, FourThreeCorsiPlusMinus, ThreeFourCorsiPlus, ThreeFourCorsiMinus, ThreeFourCorsiPlusMinus, ThreeThreeCorsiPlus, ThreeThreeCorsiMinus, ThreeThreeCorsiPlusMinus) values( \"\(inputCollegeText ?? "UnspecifiedOpponent")\", \"\(player._firstName)\", \"\(player._lastName)\", \(player._jerseyNumber), \(totIceTime), \(totShots), \(totGoals), \(totPIMMinus), \(totPIMPlus),\(totPIMPlusMinus), \(FiveFiveCorsiPlus), \(FiveFiveCorsiMinus), \(FiveFiveCorsiPlusMinus), \(FiveFiveIndivShotCorsi), \(FiveFiveIcingPlusCorsi), \(FiveFiveIcingMinusCorsi), \(FiveFiveIcingPlusMinusCorsi), \(FiveFiveIndivIcingCorsi), \(FiveFourCorsiPlus), \(FiveFourCorsiMinus), \(FiveFourCorsiPlusMinus), \(FourFiveCorsiPlus), \(FourFiveCorsiMinus), \(FourFiveCorsiPlusMinus), \(FourFourCorsiPlus), \(FourFourCorsiMinus), \(FourFourCorsiPlusMinus), \(FiveThreeCorsiPlus), \(FiveThreeCorsiMinus), \(FiveThreeCorsiPlusMinus), \(ThreeFiveCorsiPlus), \(ThreeFiveCorsiMinus), \(ThreeFiveCorsiPlusMinus), \(FourThreeCorsiPlus), \(FourThreeCorsiMinus), \(FourThreeCorsiPlusMinus), \(ThreeFourCorsiPlus), \(ThreeFourCorsiMinus), \(ThreeFourCorsiPlusMinus), \(ThreeThreeCorsiPlus), \(ThreeThreeCorsiMinus), \(ThreeThreeCorsiPlusMinus))"
            
            //print(sql)
            appDelegate.database?.executeNoReturn(execCommand: sql)
            
        }
        
        
        
        
        //        print(game.currIceNames)
        
        // CHAD!!! This is the section where you can send stats to the database for processing
        // Check out Player.swift for function calls for accessing player statistics
        // To access all players (i.e. in a loop) use game.getaAllPlayers, which returns an array of all players
        
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~FUNC BUTTONS END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    // Error Flag Button:
    
    @IBOutlet weak var errorFlagButton: UIButton!
    
    @IBAction func errorFlagClicked(_ sender: Any) {
        // what happens when the error flag is clicked
        appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "errorFlag", manpower: manpowerStr(), statOwnerNum: 0, onIce1Num: 0, onIce2Num: 0, onIce3Num: 0, onIce4Num: 0, onIce5Num: 0, onIce6Num: 0)
    }
    
    
    // table containing current players on ice for drop down menus
    //    @IBOutlet weak var playersDropDown: UITableViewCell!
    @IBOutlet weak var playersDropDown: UITableView!
    
    // hardcoding players for demo purposes: will be in each cell of drop-down menu
    var playersList = ["player1", "player2", "player3", "player4", "player5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testInputLabel?.text = inputCollegeText
        //        print(testInputLabel.text)
        //print(inputCollegeText)
        //        if let receivedText = inputCollegeText{
        //            testInputLabel.text = receivedText
        //             print(testInputLabel.text)
        //        }
        //
        testInputLabel.isHidden = true
        init_roster()
        // hidden until drop down buttons {Shot For || Goal For} are pressed
        playersDropDown.isHidden = true
        // hardcoding initial players visuals on ice for demo purposes
        //onClickGameClock((Any).self)
        
        // Nick: these need to be implemented in the storyboard
        jerseynum3.text = "OPPONENT"
        jerseynum4.text = "OPPONENT"
        timer1.text = "00:00"
        timer2.text = "00:00"
        //timer3.text = "00:00"
        //timer4.text = "00:00"
        
        clickD1((Any).self)
        clickF1((Any).self)
        clickPlayer19((Any).self)
        onClickGameClock((Any).self)
        
        // hardcoding starting manpower config
        manPow5v5.alpha = 1
        manPow5v4.alpha = 0.25
        manPow5v3.alpha = 0.25
        manPow4v5.alpha = 0.25
        manPow4v4.alpha = 0.25
        manPow4v3.alpha = 0.25
        manPow3v5.alpha = 0.25
        manPow3v4.alpha = 0.25
        manPow3v3.alpha = 0.25
        
        // shadows for blue header
        //        blueHeader.layer.shadowOffset = CGSize(width: 0, height: 5)
        blueHeader.layer.shadowOffset = CGSize(width: 1.5, height: 5)
        blueHeader.layer.shadowRadius = 1.5
        blueHeader.layer.shadowOpacity = 0.5
        
        // cosmetics for penalty boxes
        hamPenaltyBox.layer.shadowOffset = CGSize(width: 3, height: 3)
        hamPenaltyBox.layer.shadowOpacity = 0.5
        hamPenaltyBox.layer.shadowRadius = 5
        opponentPenaltyBox.layer.shadowOffset = CGSize(width: 3, height: 3)
        opponentPenaltyBox.layer.shadowOpacity = 0.5
        opponentPenaltyBox.layer.shadowRadius = 5
        
        
        // populate array of manpower buttons for handling opacity changes
        manPowerAlphas += [manPow5v5, manPow5v4, manPow5v3, manPow4v5, manPow4v4, manPow4v3, manPow3v5, manPow3v4, manPow3v3]
        
        // period button border color
        //  (other cosmetics applied through Xcode GUI)
        // ref: http://uicolor.xyz/#/hex-to-ui converting hex to UIColor codes
        let RedColor = (UIColor(red: 0.92, green: 0.25, blue: 0.15, alpha: 1))
        endPeriodButton.layer.borderColor = RedColor.cgColor
        
        // starting period opacities
        period1Label.alpha = 1
        period2Label.alpha = 0.2
        period3Label.alpha = 0.2
        otLabel.alpha = 0.2
        
        // populate array of labels
        periodLabels += [period1Label, period2Label, period3Label, otLabel]
        
        /////this loads the names of the players onto the buttons
        let currPlayers = game.getAllPlayers()
        let playerButtons = [Player1, Player2, Player3, Player4, Player5, Player6, Player7, Player8, Player9, Player10, Player11, Player12, Player13, Player14, Player15, Player16, Player17, Player18, Player19, Player20, Player21, Player22]
        for i in stride(from: 0, to: 22, by: 1) {
            playerButtons[i]!.setTitle(String(currPlayers[i]._jerseyNumber), for: .normal)
        }
        /////player buttons now have the right names on them
        
        
    }
    
    
    func animate(toggle: Bool, type: UIButton){
        // animation handler for menu drop, takes toggle param and ui button that triggers
        // animation
        if type == goalForButton {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.playersDropDown.isHidden = false
                }
            }
            else {
                UIView.animate(withDuration: 0.3) {
                    self.playersDropDown.isHidden = true
                }
                
            }
        }
    }
    
    /*
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EmailViewController{
            let vc = segue.destination as? EmailViewController
            vc?.currentOpponent = inputCollegeText
        }
        
        
    }
}




// extension for ViewController to properly handle drop-down menu
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // extends ViewController with proper functionality to handle
    // the drop-down menu
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        // builds n number of cells in the table: n = number of players on ice + 1
        // +1 for "Unknown" option
        return game.currIce.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // populates n number of cells in the table: n = number of players on ice + 1
        // +1 for "Unknown" option
        return game.currIce.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // makes cells of dropdown buff colored
        cell.textLabel?.textColor = (UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // populates dropdown menu cells with labels
        
        // get latest array of player names
//        game.updateCurrentIce()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath)
        
        // set labels to cells
        cell.textLabel?.text = String(game.currIce[indexPath.row]._jerseyNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handles what happens when a specific row is selected: "didSelectRowAt"
        
        // animation plays for drop down menu
        animate(toggle: false, type: goalForButton)
        
        // this is where the data for the selected players is handled:
        // Ex: the player selected under Goal For will get +1 to their goals made
        // Ex: the player selected under Shot For will get +1 to their shots made
        // :
        //// tested and works to track the NAMES of the player:
        // uncomment this to see the label "Player-Clicked" change to the name of the player
        //         playerClickedLabel?.text = game.currIceNames[indexPath.row]
        // NOTE:
        //          Game.swift has methods to increment stats
        //          Player.swift contains the player class
        
        
        // convert manpower arrays into manpower strings
        func aryToStr(manpower:[Int]) -> String {
            let man1 = String(manpower[0])
            let man2 = String(manpower[1])
            return man1 + "v" + man2
        }
        
        // Shot For button clicked, update that stat for selected player
        if dropDownClicked == "shotFor"{
            //            print("Shot For was clicked!")
            // : use game.currIceNames[indexPath.row] which is the jerseynumber of the selected player to access
            //          the individual player and increment their relevant stat
            //print(game.currIce[indexPath.row]._firstName)
            game.currIce[indexPath.row].increaseShotForTaken(manpower: _manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "shotFor", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            
        }
        
        // Goal For button clicked, update that stat for selected player
        if dropDownClicked == "goalFor"{
            //            print("Goal For was clicked!")
            // : use game.currIceNames[indexPath.row] which is the jerseynumber of the selected player to access
            //          the individual player and increment their relevant stat
            game.currIce[indexPath.row].increaseShotForTaken(manpower: _manpower)
            game.currIce[indexPath.row].increaseGoaltForTaken(manpower: _manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "shotFor", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "GoalFor", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            
        }
        
        if dropDownClicked == "2Us" {
            let playerClicked = game.currIce[indexPath.row]
            usPQ.newUsPenalty(player: playerClicked, time: 120, box: playerClicked.playerButton!)
            playerClicked.increasePenalty2min(manpower: _manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "2penaltyCommited", manpower: manpowerStr(), statOwnerNum: playerClicked._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            
            
            
        }
        
        if dropDownClicked == "2Them" {
            themPQ.newThemPenalty(time: 120)
            game.currIce[indexPath.row].increasePenaltyDrawn2min(manpower:_manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "2penaltyDrawn", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
        }
        
        if dropDownClicked == "4Us" {
            let playerClicked = game.currIce[indexPath.row]
            usPQ.newUsPenalty(player: playerClicked, time: 240, box: playerClicked.playerButton!)
            playerClicked.increasePenalty4min(manpower:_manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "4penaltyCommited", manpower: manpowerStr(), statOwnerNum: playerClicked._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            
            
        }
        
        if dropDownClicked == "4Them" {
            themPQ.newThemPenalty(time: 240)
            game.currIce[indexPath.row].increasePenaltyDrawn4min(manpower:_manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "4penaltyDrawn", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
        }
        
        if dropDownClicked == "5Us" {
            let playerClicked = game.currIce[indexPath.row]
            usPQ.newUsPenalty(player: playerClicked, time: 300, box: playerClicked.playerButton!)
            playerClicked.increasePenalty5min(manpower:_manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "5penaltyCommited", manpower: manpowerStr(), statOwnerNum: playerClicked._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
            
            
        }
        
        if dropDownClicked == "5Them" {
            print("penalty 5Themclicked!")
            themPQ.newThemPenalty(time: 300)
            game.currIce[indexPath.row].increasePenaltyDrawn5min(manpower:_manpower)
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "5penaltyDrawn", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
        }
        
        if dropDownClicked == "icing" {
            print("icing clicked!")
            game.currIce[indexPath.row].increaseIcingByPlayer(manpower:_manpower)
            
            let onIceNumbers = game.getOnIceNumbersAsArray()
            appDelegate.database?.addChronStat(seasonYear: game._season, game: inputCollegeText ?? "Opponent", period: gameTimer.period, time: Int(gameTimer.gameSecondsUI), statType: "icingCommited", manpower: manpowerStr(), statOwnerNum: game.currIce[indexPath.row]._jerseyNumber, onIce1Num: onIceNumbers[0], onIce2Num: onIceNumbers[1], onIce3Num: onIceNumbers[2], onIce4Num: onIceNumbers[3], onIce5Num: onIceNumbers[4], onIce6Num: onIceNumbers[5])
        }
    }
    
    
}





/*     private func loadHockeyGame() {
 let hockeyViewController = HockeyViewController()
 addChild(hockeyViewController)
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 }
 
 @IBAction func startGame(_ sender: Any) {
 loadHockeyGame()
 }
 }
 
 extension UIViewController {
 func addChild(_ child: UIViewController) {
 addChildViewController(child)
 view.addSubview(child.view)
 child.didMove(toParentViewController: self)
 }
 
 func removeChild() {
 guard parent != nil else {
 return
 }
 
 willMove(toParentViewController: nil)
 removeFromParentViewController()
 view.removeFromSuperview()
 }
 }*/


