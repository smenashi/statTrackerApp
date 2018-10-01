//
//  ViewController.swift
//  statTrackerApp
//
//  Created by Sophie Menashi on 9/11/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var countStr = ""

    @IBOutlet weak var displayCount: UILabel!
   
    
    // OUTLETS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // this contains all the outlets to all the buttons on-screen
    // organized by category for quick use and reference with
    // any functionality that is needed down the line
    
    // Game Clock and Time //////////////////
    @IBOutlet weak var gameClock: UIButton!
    @IBOutlet weak var gameTime: UILabel!
    /////////////////////////////////////////
    
    
    // Period Buttons ///////////////////////
    // set current period.alpha = 1.0, all other periods alpha = 0.5
    @IBOutlet weak var period1: UIButton!
    @IBOutlet weak var period2: UIButton!
    @IBOutlet weak var period3: UIButton!
    @IBOutlet weak var overtime: UIButton!
    
    /////////////////////////////////////////
    
    // Man Power Configurations Buttons /////
    @IBOutlet weak var manPow5v5: UIButton!
    @IBOutlet weak var manPow5v4: UIButton!
    @IBOutlet weak var manPow5v3: UIButton!
    @IBOutlet weak var manPow4v5: UIButton!
    @IBOutlet weak var manPow3v5: UIButton!
    @IBOutlet weak var manPow3v3: UIButton!
    /////////////////////////////////////////
    
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
    @IBOutlet weak var penaltiesButton: UIButton!

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
        
    }
    @IBAction func click5v4(_ sender: Any) {
        // manpower button 5v4 is clicked: change current manpower config to 5v4
    }
    @IBAction func click5v3(_ sender: Any) {
        // manpower button 5v3 is clicked: change current manpower config to 5v3
    }
    @IBAction func click4v5(_ sender: Any) {
        // manpower button 4v5 is clicked: change current manpower config to 4v5
    }
    @IBAction func click3v5(_ sender: Any) {
        // manpower button 3v5 is clicked: change current manpower config to 3v5
    }
    @IBAction func click3v3(_ sender: Any) {
        // manpower button 3v3 is clicked: change current manpower config to 3v3
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
    }
    @IBAction func clickPlayer2(_ sender: Any) {
        // Player2 is clicked
    }
    @IBAction func clickPlayer3(_ sender: Any) {
        // Player3 is clicked
    }
    @IBAction func clickPlayer4(_ sender: Any) {
        // Player4 is clicked
    }
    @IBAction func clickPlayer5(_ sender: Any) {
        // Player5 is clicked
    }
    @IBAction func clickPlayer6(_ sender: Any) {
        // Player6 is clicked
    }
    @IBAction func clickPlayer7(_ sender: Any) {
        // Player7 is clicked
    }
    @IBAction func clickPlayer8(_ sender: Any) {
        // Player8 is clicked
    }
    @IBAction func clickPlayer9(_ sender: Any) {
        // Player9 is clicked
    }
    @IBAction func clickPlayer10(_ sender: Any) {
        // Player10 is clicked
    }
    @IBAction func clickPlayer11(_ sender: Any) {
        // Player11 is clicked
    }
    @IBAction func clickPlayer12(_ sender: Any) {
        // Player12 is clicked
    }
    @IBAction func clickPlayer13(_ sender: Any) {
        // Player13 is clicked
    }
    @IBAction func clickPlayer14(_ sender: Any) {
        // Player14 is clicked
    }
    @IBAction func clickPlayer15(_ sender: Any) {
        // Player15 is clicked
    }
    @IBAction func clickPlayer16(_ sender: Any) {
        // Player16 is clicked
    }
    @IBAction func clickPlayer17(_ sender: Any) {
        // Player17 is clicked
    }
    @IBAction func clickPlayer18(_ sender: Any) {
        // Player18 is clicked
    }
    @IBAction func clickPlayer19(_ sender: Any) {
        // Player19 is clicked
    }
    @IBAction func clickPlayer20(_ sender: Any) {
        // Player20 is clicked
    }
    @IBAction func clickPlayer21(_ sender: Any) {
        // Player21 is clicked
    }
    @IBAction func clickPlayer22(_ sender: Any) {
        // Player22 is clicked
    }
    
    
    // -------------------------------------------------------------------------------
    // Event buttons:   these are (for now)
    //                      - Shot For
    //                      - Shot Against
    //                      - Goal For
    //                      - Goal Against
    //                      - Penalties
    //
    // Cosmetically:    - Shot For, Goal For have drop-down menus attached to them
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
    @IBAction func onClickShotForButton(_ sender: Any) {
        // Shot For button clicked: update relevant stats to the players on ice, along with other stats
        
        // get new X & Y positions for the drop-down menu
        let newX = shotForButton.frame.minX
        let newY = shotForButton.frame.maxY
        
        // animations for drop-down menu ---------------
        if playersDropDown.isHidden{
            //update x and y coords
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // execute relevant stat updates here
    }
    @IBAction func onClickShotAgainst(_ sender: Any) {
        // shot against clicked: update relevant stats to players on ice,
        //                       and any other stats
        
    }
    

    @IBAction func onClickGoalForButton(_ sender: Any) {
        // Goal For button clicked: update relevant stats to current players on ice
        // ref:
        // https://www.youtube.com/watch?v=b1LiBiLjca4&index=13&list=PLWVdXdO5KDTwyK5ic9OYI49_EpkEP4v8M&t=0s
        
        // get new X & Y positions for the drop-down menu
        let newX = goalForButton.frame.minX
        let newY = goalForButton.frame.maxY
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            //update x and y coords
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // execute relevant stat updates here
        
        
    }
    
    @IBAction func onClickGoalAgainst(_ sender: Any) {
        // Goal Against button clicked: update relevant stats to players on ice
        //                              and any other stats
        
    }
    
    @IBAction func onClickPenalties(_ sender: Any) {
        // Penalties button clicked: update stats to players on ice accordingly
        //                           and any other stats
        
        // get new X & Y positions for the drop-down menu
        let newX = penaltiesButton.frame.minX
        let newY = penaltiesButton.frame.maxY
        
        // animation plays that "drops down" the table view --
        if playersDropDown.isHidden{
            //update x and y coords
            playersDropDown.frame.origin.x = newX
            playersDropDown.frame.origin.y = newY
            animate(toggle: true, type: goalForButton)
        }
        else{
            animate(toggle: false, type: goalForButton)
        }
        
        // execute relevant stat updates here
        
    }
    
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
    }
    
    @IBAction func clickF2(_ sender: Any) {
        // F2 line button clicked:  disengage 3 players from F, put F2 players on
    }
    
    @IBAction func clickF3(_ sender: Any) {
        // F3 line button clicked:  disengage 3 players from F, put F3 players on
    }
    
    @IBAction func clickF4(_ sender: Any) {
        // F4 line button clicked:  disengage 3 players from F, put F4 players on
    }
    
    @IBAction func clickD1(_ sender: Any) {
        // D1 line button clicked:  disengage 2 players from D, put D1 players on
    }
    
    @IBAction func clickD2(_ sender: Any) {
        // D2 line button clicked:  disengage 2 players from D, put D2 players on
    }
    
    @IBAction func clickD3(_ sender: Any) {
        // D3 line button clicked:  disengage 2 players from D, put D3 players on
    }
    
    
    // -------------------------------------------------------------------------------
    // Game Clock Button: this starts/stops the countdown timer for the game
    // ref: https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
    

    // running value that will be updated
    var gameSeconds = 1200                  // this will be converted and formatted appropriately
    // init timer object
    var gameTimer = Timer()
    // to reset timer whenever a period ends
    var newPeriod = true
    
    // boolean making sure only one timer is created
    var isTimerRunning = false
    
    // gates game clock button usage
    var clockPaused = true
    
    @IBAction func onClickGameClock(_ sender: Any) {
        // CLOCK button clicked:
        
        if newPeriod == true{   // check if we started a new period
            gameSeconds = 1200  // reset time
            newPeriod = false   // update flag
        }
        
        if self.clockPaused == false{
            // pauses the clock and changes boolean value
            gameTimer.invalidate()
            isTimerRunning = true
            self.clockPaused = true
        }
            
        else{
            // continues running the timer
            runTimer()
            self.clockPaused = false
           // isTimerRunning = true
        }
    }
    
    func runTimer() {
        // runs the timer countdown
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        // updates the values displayed on the game time label
        gameSeconds -= 1
        // update label with properly-formatted version:
        gameTime.text = formatTime(time: TimeInterval(gameSeconds))
    }
    
    func formatTime(time:TimeInterval) -> String{
            // formats the time on the time label to the desired format: hh:mm:ss
            // standard modular arithmetic to derive hours, minutes, seconds from given seconds
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            
            // string will be formatted with 2 digits for each of the values derived above
            return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
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
        gameTimer.invalidate()              // stop timer
        let initSeconds = 1200
        gameTime.text = formatTime(time: TimeInterval(initSeconds)) // reset label
        isTimerRunning = false
        newPeriod = true
        self.clockPaused = true
        
        // execute relevant stat-related logic for end of period here
    }
    
    // -------------------------------------------------------------------------------
    // End Game Button: this ends the game
    @IBAction func onClickEndGame(_ sender: Any) {
        // cleanup and data prep occurs// -------------------------------------------------------------------------------
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~FUNC BUTTONS END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    
    // table containing current players on ice for drop down menus
    @IBOutlet weak var playersDropDown: UITableView!
    
    // hardcoding players for demo purposes: will be in each cell of drop-down menu
    var playersList = ["player1", "player2", "player3", "player4", "player5"]
    
    // array that will contain
    var playersOnIce = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        print("Number of players in playersList: \(playersList.count)")
        print(playersList[1])
        
       // print("Number of players in onIce set: \(playersOnIce)")
        
        // hidden until drop down buttons {Shot For || Goal For} are pressed
        playersDropDown.isHidden = true
        // hardcoding initial players visuals on ice for demo purposes
        Player1.backgroundColor = .green
        Player2.backgroundColor = .green
        Player3.backgroundColor = .green
        Player13.backgroundColor = .green
        Player14.backgroundColor = .green
        Player20.backgroundColor = .green
        
        // hardcoding starting manpower config for demo purposes
        manPow3v5.alpha = 0.5
        manPow3v3.alpha = 0.5
        manPow4v5.alpha = 0.5
        manPow5v3.alpha = 0.5
        manPow5v4.alpha = 0.5
        manPow5v5.alpha = 1
        
        // hardcoding starting period opacities
        period1.alpha = 1
        period2.alpha = 0.5
        period3.alpha = 0.5
        overtime.alpha = 0.5
        
        //print("Hello, World!")
        // NOTE: encounters error here, need to solve conflicting constraints
        // that don't show up in the XCode UI
        //print(playersList.count)
    }
    
    
    
//    @IBAction func onClickGoalFor(_ sender: Any) {
//        // animation plays that "drops down" the table view
//        if playersOnIce.isHidden{
//            animate(toggle: true, type: goalForButton)
//        }
//        else{
//            animate(toggle: false, type: goalForButton)
//        }
//
//    }
    
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
    ////////////////////////////////////////////////////////////
    
    
    @IBAction func addPressed(_ sender: Any) {
        count += 1
    }
    
    
    @IBAction func getCountPressed(_ sender: Any) {
        countStr = String(count)
        displayCount.text = countStr
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of cells in table: depends on number of players on ice (NOT harcoded 5)
        
        print(playersList.count)
        return playersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("accessed tableView function")
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath)
        // creates one cell #of playerList.count times, with label corresponding
        // to the name in each index
        cell.textLabel?.text = playersList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animate(toggle: false, type: goalForButton)
        // access the cell in the table selected via: playerList[indexPath.row]
        // this is where the data for the selected players is handled:
        // Ex: the player selected under Goal For will get +1 to their goals made
        // Ex: the player selected under Shot For will get +1 to their shots made
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

