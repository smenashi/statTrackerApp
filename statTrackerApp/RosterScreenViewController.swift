//
//  RosterScreenViewController.swift
//  statTrackerApp
//
//  Created by Nikoloz (Nick) Chkonia on 10/25/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit

class rosterPlayer {
    var studentID: String
    var lastName: String
    var number: Int
    var position: Int //numbers here correspond to boxes - i.e. 1 is top left, 2 top middle, etc (0=inactive)
    
    init(studentID: String, lastName: String, number: Int, position: Int) {
        self.studentID = studentID
        self.lastName = lastName
        self.number = number
        self.position = position
    }
}


// NOTE: this is tied to the Roster Screen in HockeyUI.storyboard
class RosterScreenViewController: UIViewController {
    //    ref: https://www.youtube.com/watch?v=MC4mDQ7UqEE
    @IBOutlet weak var RosterTable: UITableView!
    @IBOutlet weak var removePlayer: UIButton!
    @IBOutlet weak var addPlayer: UIButton!
    @IBOutlet weak var next_name: UIButton!
    @IBOutlet weak var next_number: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var inputField: UITextField!
    
    //roster position buttons
    @IBOutlet weak var F11Button: UIButton!
    @IBOutlet weak var F12Button: UIButton!
    @IBOutlet weak var F13Button: UIButton!
    @IBOutlet weak var F21Button: UIButton!
    @IBOutlet weak var F22Button: UIButton!
    @IBOutlet weak var F23Button: UIButton!
    @IBOutlet weak var F31Button: UIButton!
    @IBOutlet weak var F32Button: UIButton!
    @IBOutlet weak var F33Button: UIButton!
    @IBOutlet weak var F41Button: UIButton!
    @IBOutlet weak var F42Button: UIButton!
    @IBOutlet weak var F43Button: UIButton!
    @IBOutlet weak var D11Button: UIButton!
    @IBOutlet weak var D12Button: UIButton!
    @IBOutlet weak var D21Button: UIButton!
    @IBOutlet weak var D22Button: UIButton!
    @IBOutlet weak var D31Button: UIButton!
    @IBOutlet weak var D32Button: UIButton!
    @IBOutlet weak var X1Button: UIButton!
    @IBOutlet weak var G1Button: UIButton!
    @IBOutlet weak var G2Button: UIButton!
    @IBOutlet weak var G3Button: UIButton!
    
    //actions on roster buttons clicked, adds currently selected player to that spot
    @IBAction func P1Clicked(_ sender: Any) {
        p1?.position = 0
        p1 = currentSelectedPlayer
        p1?.position = 1
        F11Button.setTitle(p1?.lastName, for: .normal)
    }
    @IBAction func P2Clicked(_ sender: Any) {
        p2?.position = 0
        p2 = currentSelectedPlayer
        p2?.position = 2
        F12Button.setTitle(p2?.lastName, for: .normal)
    }
    @IBAction func P3Clicked(_ sender: Any) {
        p3?.position = 0
        p3 = currentSelectedPlayer
        p3?.position = 3
        F13Button.setTitle(p3?.lastName, for: .normal)
    }
    @IBAction func P4Clicked(_ sender: Any) {
        p4?.position = 0
        p4 = currentSelectedPlayer
        p4?.position = 4
        F21Button.setTitle(p4?.lastName, for: .normal)
    }
    @IBAction func P5Clicked(_ sender: Any) {
        p5?.position = 0
        p5 = currentSelectedPlayer
        p5?.position = 5
        F22Button.setTitle(p5?.lastName, for: .normal)
    }
    @IBAction func P6Clicked(_ sender: Any) {
        p6?.position = 0
        p6 = currentSelectedPlayer
        p6?.position = 6
        F23Button.setTitle(p6?.lastName, for: .normal)
    }
    @IBAction func P7Clicked(_ sender: Any) {
        p7?.position = 0
        p7 = currentSelectedPlayer
        p7?.position = 7
        F31Button.setTitle(p7?.lastName, for: .normal)
    }
    @IBAction func P8Clicked(_ sender: Any) {
        p8?.position = 0
        p8 = currentSelectedPlayer
        p8?.position = 8
        F32Button.setTitle(p8?.lastName, for: .normal)
    }
    @IBAction func P9Clicked(_ sender: Any) {
        p9?.position = 0
        p9 = currentSelectedPlayer
        p9?.position = 9
        F33Button.setTitle(p9?.lastName, for: .normal)
    }
    @IBAction func P10Clicked(_ sender: Any) {
        p10?.position = 0
        p10 = currentSelectedPlayer
        p10?.position = 10
        F41Button.setTitle(p10?.lastName, for: .normal)
    }
    @IBAction func P11Clicked(_ sender: Any) {
        p11?.position = 0
        p11 = currentSelectedPlayer
        p11?.position = 11
        F42Button.setTitle(p11?.lastName, for: .normal)
    }
    @IBAction func P12Clicked(_ sender: Any) {
        p12?.position = 0
        p12 = currentSelectedPlayer
        p12?.position = 12
        F43Button.setTitle(p12?.lastName, for: .normal)
    }
    @IBAction func P13Clicked(_ sender: Any) {
        p13?.position = 0
        p13 = currentSelectedPlayer
        p13?.position = 13
        D11Button.setTitle(p13?.lastName, for: .normal)
    }
    @IBAction func P14Clicked(_ sender: Any) {
        p14?.position = 0
        p14 = currentSelectedPlayer
        p14?.position = 14
        D12Button.setTitle(p14?.lastName, for: .normal)
    }
    @IBAction func P15Clicked(_ sender: Any) {
        p15?.position = 0
        p15 = currentSelectedPlayer
        p15?.position = 15
        D21Button.setTitle(p15?.lastName, for: .normal)
    }
    @IBAction func P16Clicked(_ sender: Any) {
        p16?.position = 0
        p16 = currentSelectedPlayer
        p16?.position = 16
        D22Button.setTitle(p16?.lastName, for: .normal)
    }
    @IBAction func P17Clicked(_ sender: Any) {
        p17?.position = 0
        p17 = currentSelectedPlayer
        p17?.position = 17
        D31Button.setTitle(p17?.lastName, for: .normal)
    }
    @IBAction func P18Clicked(_ sender: Any) {
        p18?.position = 0
        p18 = currentSelectedPlayer
        p18?.position = 18
        D32Button.setTitle(p18?.lastName, for: .normal)
    }
    @IBAction func P22Clicked(_ sender: Any) {
        p22?.position = 0
        p22 = currentSelectedPlayer
        p22?.position = 22
        X1Button.setTitle(p22?.lastName, for: .normal)
    }
    @IBAction func P19Clicked(_ sender: Any) {
        p19?.position = 0
        p19 = currentSelectedPlayer
        p19?.position = 19
        G1Button.setTitle(p19?.lastName, for: .normal)
    }
    @IBAction func P20Clicked(_ sender: Any) {
        p20?.position = 0
        p20 = currentSelectedPlayer
        p20?.position = 20
        G2Button.setTitle(p20?.lastName, for: .normal)
    }
    @IBAction func P21Clicked(_ sender: Any) {
        p21?.position = 0
        p21 = currentSelectedPlayer
        p21?.position = 21
        G3Button.setTitle(p21?.lastName, for: .normal)
    }
    
    //keeps track of which player is currently selected
    var currentSelectedPlayer: rosterPlayer?
    
    //init@0: this will be populated with players
    var playerArray: [rosterPlayer] = []
    
    //keep track of which players are where
    var p1: rosterPlayer?
    var p2: rosterPlayer?
    var p3: rosterPlayer?
    var p4: rosterPlayer?
    var p5: rosterPlayer?
    var p6: rosterPlayer?
    var p7: rosterPlayer?
    var p8: rosterPlayer?
    var p9: rosterPlayer?
    var p10: rosterPlayer?
    var p11: rosterPlayer?
    var p12: rosterPlayer?
    var p13: rosterPlayer?
    var p14: rosterPlayer?
    var p15: rosterPlayer?
    var p16: rosterPlayer?
    var p17: rosterPlayer?
    var p18: rosterPlayer?
    var p19: rosterPlayer?
    var p20: rosterPlayer?
    var p21: rosterPlayer?
    var p22: rosterPlayer?
    
    // these will be used when adding players
    var studentID = ""
    var lastName = ""
    var number = ""
    var cellBuffer = "" // buffers above attributes to place in the table row
    
    func flushInput(){
        //flushes input prompt
        inputField.text = ""
    }
    
    func insertStudentID(){
        // saves info from input in studentID var
        studentID.append(inputField.text!)
        flushInput()
    }
    
    func insertPlayerName(){
        // saves info from input to lastName var
        lastName.append(inputField.text!)
        flushInput()
    }
    
    func insertPlayerNumber(){
        // saves info from input to number var
        number.append(inputField.text!)
        flushInput()
    }
    
    @IBAction func addPlayerClicked(_ sender: Any) {
        next_name.isHidden = false
    }

    @IBAction func next_nameClicked(_ sender: Any) {
        // input from studentId is processed
        insertStudentID()
        next_name.isHidden = true
        next_number.isHidden = false
    }

    @IBAction func next_numberClicked(_ sender: Any) {
        // input for lastName processed
        insertPlayerName()
        next_number.isHidden = true
        doneButton.isHidden = false
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
       // when user clicks the done button, buffer gets flushed to table and cleared
        // input for jersey number is processed
        insertPlayerNumber()
        print(lastName)
        print(number)
        
        // append variables to cellBuffer
        //cellBuffer += "\(studentID) "
        //cellBuffer += "\(lastName) "
        //cellBuffer += "\(number) "
        
        playerArray.append(rosterPlayer(studentID: studentID, lastName: lastName, number: Int(number) ?? 0, position: 0))
        
        // append to array that will populate the tableView
        //playerArray.append(cellBuffer)
        
        // no sections, insert
        let indexPath = IndexPath(row: playerArray.count - 1, section:0)
        // insertion
        RosterTable.beginUpdates()
        RosterTable.insertRows(at: [indexPath], with: .automatic)
        RosterTable.endUpdates()
        
        // clear buffer
        cellBuffer = ""
        // clear variables
        studentID = ""
        lastName = ""
        number = ""
        
        // end editting
        view.endEditing(true)
        print(playerArray)
        for player in playerArray{
            print(player.lastName+" "+String(player.position))
        }
    }

    
    @IBAction func removePlayerClicked(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide buttons for input handling
        doneButton.isHidden = true
        next_name.isHidden = true
        next_number.isHidden = true
        
        // hidden unless add button is clicked
//        inputField.isHidden = true
        // Do any additional setup after loading the view.
    }
}
    // extension for ViewController to properly handle drop-down menu
extension RosterScreenViewController: UITableViewDelegate, UITableViewDataSource {
  
    
        // extends ViewController with proper functionality to handle
        // the drop-down menu
        
        
        func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
            // builds n number of cells in the table: hardcoded as 33 for now
            return 33
//            return testArray.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // populates n number of cells in the table:
            return playerArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // populates dropdown menu cells with labels
            let cell = tableView.dequeueReusableCell(withIdentifier: "player_roster", for: indexPath)
            // CHAD: as in ViewController.swift place here on the RHS, instead of "Player" what exactly you want
            cell.textLabel?.text = playerArray[indexPath.row].lastName
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // lets us edit rows for deletion
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("&&&")
        print(indexPath)
        print(playerArray[indexPath.row])
        currentSelectedPlayer = playerArray[indexPath.row]
        print("&&&")
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // how we edit the row: delete
        if editingStyle == .delete{
            playerArray.remove(at: indexPath.row) //remove we swiped
            RosterTable.beginUpdates()
            RosterTable.deleteRows(at: [indexPath], with: .automatic)
            RosterTable.endUpdates()
        }
    }
    
    
    
            
            
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }

