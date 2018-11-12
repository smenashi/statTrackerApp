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
    
    var playerButtonColor = UIColor(red: 0.83921569, green: 0.72941176, blue: 0.54509804, alpha: 1.0)
    
    // hard-coding game
    var game = Game(player1: Player(firstName: "Willet", lastName: "9", jerseyNum: 9), player2: Player(firstName: "Brochu", lastName: "15", jerseyNum: 15), player3: Player(firstName: "Conway", lastName: "18", jerseyNum: 18), player4: Player(firstName: "Beniers", lastName: "16", jerseyNum: 16), player5: Player(firstName: "Gagnon", lastName: "10", jerseyNum: 10), player6: Player(firstName: "Bray", lastName: "26", jerseyNum: 26), player7: Player(firstName: "Bruneteau", lastName: "22", jerseyNum: 22), player8: Player(firstName: "Daigler", lastName: "20", jerseyNum: 20), player9: Player(firstName: "Ursitti", lastName: "12", jerseyNum: 12), player10: Player(firstName: "Stickel", lastName: "27", jerseyNum: 27), player11: Player(firstName: "Nichols", lastName: "23", jerseyNum: 23), player12: Player(firstName: "Simson", lastName: "19", jerseyNum: 19), player13: Player(firstName: "Allen", lastName: "5", jerseyNum: 5), player14: Player(firstName: "Labonte", lastName: "4", jerseyNum: 4), player15: Player(firstName: "Jones", lastName: "44", jerseyNum: 44), player16: Player(firstName: "Morrison", lastName: "14", jerseyNum: 14), player17: Player(firstName: "Chen", lastName: "7", jerseyNum: 7), player18: Player(firstName: "Cochrane", lastName: "2", jerseyNum: 2), player19: Player(firstName: "Buitenhuis", lastName: "29", jerseyNum: 29), player20: Player(firstName: "Tiribassi", lastName: "34", jerseyNum: 34), player21: Player(firstName: "Negron", lastName: "1", jerseyNum: 1), player22: Player(firstName: "Stimola", lastName: "6", jerseyNum: 6))

    var _manpower: String = "5v5"

    @IBOutlet weak var displayCount: UILabel!
   
    
    // OUTLETS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // this contains all the outlets to all the buttons on-screen
    // organized by category for quick use and reference with
    // any functionality that is needed down the line
    
    // Game Clock and Time //////////////////
    @IBOutlet weak var gameClock: UIButton!
    @IBOutlet weak var gameTime: UILabel!
    /////////////////////////////////////////
    
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
    @IBOutlet weak var manPow3v5: UIButton!
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
        manPowerAlphas[currConfig].alpha = 0.5
        manPow5v5.alpha = 1
        currConfig = 0

    }
    @IBAction func click5v4(_ sender: Any) {
        // manpower button 5v4 is clicked: change current manpower config to 5v4
        manPowerAlphas[currConfig].alpha = 0.5
        manPow5v4.alpha = 1
        currConfig = 1
    }
    @IBAction func click5v3(_ sender: Any) {
        // manpower button 5v3 is clicked: change current manpower config to 5v3
        manPowerAlphas[currConfig].alpha = 0.5
        manPow5v3.alpha = 1
        currConfig = 2
    }
    @IBAction func click4v5(_ sender: Any) {
        // manpower button 4v5 is clicked: change current manpower config to 4v5
        manPowerAlphas[currConfig].alpha = 0.5
        manPow4v5.alpha = 1
        currConfig = 3
    }
    @IBAction func click3v5(_ sender: Any) {
        // manpower button 3v5 is clicked: change current manpower config to 3v5
        manPowerAlphas[currConfig].alpha = 0.5
        manPow3v5.alpha = 1
        currConfig = 4
    }
    @IBAction func click3v3(_ sender: Any) {
        // manpower button 3v3 is clicked: change current manpower config to 3v3
        manPowerAlphas[currConfig].alpha = 0.5
        manPow3v3.alpha = 1
        currConfig = 5
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
            Player1.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player1.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer2(_ sender: Any) {
        // Player2 is clicked
        let player = game.getPlayer(number: 1)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player2.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player2.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer3(_ sender: Any) {
        // Player3 is clicked
        let player = game.getPlayer(number: 2)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player3.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player3.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer4(_ sender: Any) {
        // Player4 is clicked
        let player = game.getPlayer(number: 3)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player4.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player4.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer5(_ sender: Any) {
        // Player5 is clicked
        let player = game.getPlayer(number: 4)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player5.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player5.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer6(_ sender: Any) {
        // Player6 is clicked
        let player = game.getPlayer(number: 5)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player6.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player6.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer7(_ sender: Any) {
        // Player7 is clicked
        let player = game.getPlayer(number: 6)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player7.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player7.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer8(_ sender: Any) {
        // Player8 is clicked
        let player = game.getPlayer(number: 7)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player8.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player8.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer9(_ sender: Any) {
        // Player9 is clicked
        let player = game.getPlayer(number: 8)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player9.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player9.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer10(_ sender: Any) {
        // Player10 is clicked
        let player = game.getPlayer(number: 9)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player10.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player10.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer11(_ sender: Any) {
        // Player11 is clicked
        let player = game.getPlayer(number: 10)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player11.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player11.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer12(_ sender: Any) {
        // Player12 is clicked
        let player = game.getPlayer(number: 11)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player12.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player12.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer13(_ sender: Any) {
        // Player13 is clicked
        let player = game.getPlayer(number: 12)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player13.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player13.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer14(_ sender: Any) {
        // Player14 is clicked
        let player = game.getPlayer(number: 13)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player14.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player14.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer15(_ sender: Any) {
        // Player15 is clicked
        let player = game.getPlayer(number: 14)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player15.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player15.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer16(_ sender: Any) {
        // Player16 is clicked
        let player = game.getPlayer(number: 15)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player16.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player16.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer17(_ sender: Any) {
        // Player17 is clicked
        let player = game.getPlayer(number: 16)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player17.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player17.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer18(_ sender: Any) {
        // Player18 is clicked
        let player = game.getPlayer(number: 17)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player18.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player18.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer19(_ sender: Any) {
        // Player19 is clicked
        let player = game.getPlayer(number: 18)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player19.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player19.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer20(_ sender: Any) {
        // Player20 is clicked
        let player = game.getPlayer(number: 19)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player20.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player20.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer21(_ sender: Any) {
        // Player21 is clicked
        let player = game.getPlayer(number: 20)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player21.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player21.backgroundColor = .green
            }
        }
    }
    @IBAction func clickPlayer22(_ sender: Any) {
        // Player22 is clicked
        let player = game.getPlayer(number: 21)
        if player.isEnabled() {
            game.takeOffIce(removePlayer: player)
            Player22.backgroundColor = playerButtonColor
        } else {
            if !game.iceIsFull() {
                game.putOnIce(addPlayer: player)
                Player22.backgroundColor = .green
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
        
    }
    
    @IBAction func onClickGoalAgainst(_ sender: Any) {
        // Goal Against button clicked: update relevant stats to players on ice
        //                              and any other stats
        game.goalAgainst()
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
    }
    
    
    // Penalty Buttons:
    // ----------------------------------------------
    // <Min> For: -------------------
    
    
    @IBOutlet weak var penalty2ForButton: UIButton!
    
    @IBAction func penalty2ForClicked(_ sender: Any) {
        // 2:00 For clicked: update relevant stats to players on ice
        //  has drop-down for selecting player
        
        
        playersDropDown.reloadData() // reload drop-down data
        dropDownClicked = "2For" // mark which dropDown was clicked
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
        dropDownClicked = "4For" // mark which dropDown was clicked
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
        dropDownClicked = "5For" // mark which dropDown was clicked
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
        dropDownClicked = "2Against" // mark which dropDown was clicked
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
        dropDownClicked = "4Against" // mark which dropDown was clicked
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
        dropDownClicked = "5Against" // mark which dropDown was clicked
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
    // timer labels
    @IBOutlet weak var timer1: UILabel!
    @IBOutlet weak var timer2: UILabel!
    
    
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
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for forward in f1 {
            let playerButton = playerButtons[forward]
            game.putOnIce(addPlayer: game.getPlayer(number: forward))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickF2(_ sender: Any) {
        // F2 line button clicked:  disengage 3 players from F, put F2 players on
        let ice = game.getIce()
        let f2 = [3, 4, 5]
        for player in ice {
            if player < 12 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for forward in f2 {
            let playerButton = playerButtons[forward]
            game.putOnIce(addPlayer: game.getPlayer(number: forward))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickF3(_ sender: Any) {
        // F3 line button clicked:  disengage 3 players from F, put F3 players on
        let ice = game.getIce()
        let f3 = [6, 7, 8]
        for player in ice {
            if player < 12 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for forward in f3 {
            let playerButton = playerButtons[forward]
            game.putOnIce(addPlayer: game.getPlayer(number: forward))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickF4(_ sender: Any) {
        // F4 line button clicked:  disengage 3 players from F, put F4 players on
        let ice = game.getIce()
        let f4 = [9, 10, 11]
        for player in ice {
            if player < 12 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for forward in f4 {
            let playerButton = playerButtons[forward]
            game.putOnIce(addPlayer: game.getPlayer(number: forward))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickD1(_ sender: Any) {
        // D1 line button clicked:  disengage 2 players from D, put D1 players on
        let ice = game.getIce()
        let d1 = [12, 13]
        for player in ice {
            if player > 11 && player < 18 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for defender in d1 {
            let playerButton = playerButtons[defender]
            game.putOnIce(addPlayer: game.getPlayer(number: defender))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickD2(_ sender: Any) {
        // D2 line button clicked:  disengage 2 players from D, put D2 players on
        let ice = game.getIce()
        let d2 = [14, 15]
        for player in ice {
            if player > 11 && player < 18 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for defender in d2 {
            let playerButton = playerButtons[defender]
            game.putOnIce(addPlayer: game.getPlayer(number: defender))
            playerButton?.backgroundColor = .green
        }
    }
    
    @IBAction func clickD3(_ sender: Any) {
        // D3 line button clicked:  disengage 2 players from D, put D3 players on
        let ice = game.getIce()
        let d3 = [16, 17]
        for player in ice {
            if player > 11 && player < 18 {
                let playerButton = playerButtons[player]
                game.takeOffIce(removePlayer: game.getPlayer(number: player))
                playerButton?.backgroundColor = playerButtonColor
            }
        }
        for defender in d3 {
            let playerButton = playerButtons[defender]
            game.putOnIce(addPlayer: game.getPlayer(number: defender))
            playerButton?.backgroundColor = .green
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
                game.getPlayer(number: player).startClock()
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
        gameTimer.startNewPeriod(timerLabel: gameTime)
        
        // change alphas of period labels
        if currPeriod != 3{
            periodLabels[currPeriod].alpha = 0.5
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
            sql = "replace into playerStats(name, number, iceTime, shotsFor, shotsForTaken, shotsAgainst, goalsFor, goalsForTaken, goalsAgainst) values( \"\(player._firstName)\", \(player._jerseyNumber), \(player.iceTime), \(player.shotFor), \(player.shotForTaken), \(player.shotAgainst), \(player.goalFor), \(player.goalForTaken), \(player.goalAgainst))"
            
            //print(sql)
            appDelegate.database?.executeNoReturn(execCommand: sql)
            
        }
        //let emailer = EmailViewController()
        let mystring = appDelegate.database?.getStatTableCSV()
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        // Configure the fields of the interface.
        composeVC.setToRecipients(["cmorse529@gmail.com"])
        composeVC.setSubject("Game Statistics Summary")
        composeVC.setMessageBody("Statistics attached", isHTML: false)
        composeVC.addAttachmentData((mystring?.data(using: .utf8))!, mimeType: "text/csv", fileName: "gameStats.csv")
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
        
        
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
    }
    
    
    // table containing current players on ice for drop down menus
//    @IBOutlet weak var playersDropDown: UITableViewCell!
    @IBOutlet weak var playersDropDown: UITableView!
    
    // hardcoding players for demo purposes: will be in each cell of drop-down menu
    var playersList = ["player1", "player2", "player3", "player4", "player5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hidden until drop down buttons {Shot For || Goal For} are pressed
        playersDropDown.isHidden = true
        // hardcoding initial players visuals on ice for demo purposes
        //onClickGameClock((Any).self)
        
        clickD1((Any).self)
        clickF1((Any).self)
        clickPlayer19((Any).self)
        onClickGameClock((Any).self)
        
        // hardcoding starting manpower config for demo purposes
        manPow3v5.alpha = 0.5
        manPow3v3.alpha = 0.5
        manPow4v5.alpha = 0.5
        manPow5v3.alpha = 0.5
        manPow5v4.alpha = 0.5
        manPow5v5.alpha = 1
       
        // populate array of manpower buttons for handling opacity changes
        manPowerAlphas += [manPow5v5, manPow5v4, manPow5v3, manPow4v5, manPow3v5, manPow3v3]
        
        // starting period opacities
        period1Label.alpha = 1
        period2Label.alpha = 0.5
        period3Label.alpha = 0.5
        otLabel.alpha = 0.5
        
        // populate array of labels
        periodLabels += [period1Label, period2Label, period3Label, otLabel]
       
        /////this loads the names of the players onto the buttons
        let currPlayers = game.getAllPlayers()
        let playerButtons = [Player1, Player2, Player3, Player4, Player5, Player6, Player7, Player8, Player9, Player10, Player11, Player12, Player13, Player14, Player15, Player16, Player17, Player18, Player19, Player20, Player21, Player22]
        for i in stride(from: 0, to: 22, by: 1) {
            playerButtons[i]!.setTitle(currPlayers[i]._firstName, for: .normal)
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

}




// extension for ViewController to properly handle drop-down menu
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // extends ViewController with proper functionality to handle
    // the drop-down menu
    
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        // builds n number of cells in the table: n = number of players on ice + 1
        // +1 for "Unknown" option
        return game.getIce().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // populates n number of cells in the table: n = number of players on ice + 1
        // +1 for "Unknown" option
        return game.getIce().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // populates dropdown menu cells with labels
       
        // get latest array of player names
        game.updateCurrentIce()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath)
        
        // set labels to cells
        cell.textLabel?.text = game.currIce[indexPath.row]._firstName
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
        
        
        // Shot For button clicked, update that stat for selected player
        if dropDownClicked == "shotFor"{
//            print("Shot For was clicked!")
            // : use game.currIceNames[indexPath.row] which is the jerseynumber of the selected player to access
            //          the individual player and increment their relevant stat
            //print(game.currIce[indexPath.row]._firstName)
            game.currIce[indexPath.row].increaseShotForTaken(manpower: _manpower)
        
        }
        
        // Goal For button clicked, update that stat for selected player
        if dropDownClicked == "goalFor"{
//            print("Goal For was clicked!")
            // : use game.currIceNames[indexPath.row] which is the jerseynumber of the selected player to access
            //          the individual player and increment their relevant stat
            game.currIce[indexPath.row].increaseShotForTaken(manpower: _manpower)
            game.currIce[indexPath.row].increaseGoaltForTaken(manpower: _manpower)
            
        }
        
        if dropDownClicked == "penaltyFor" {
            print("penaltyFor clicked!")
            game.currIce[indexPath.row].increasePenaltyFor(manpower:_manpower)
        }
/*
        if dropDownClicked == "penaltyAgainst"{
            
        }
*/
        if dropDownClicked == "icing" {
            print("icing clicked!")
            game.currIce[indexPath.row].increaseIcingByPlayer(manpower:_manpower)
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

