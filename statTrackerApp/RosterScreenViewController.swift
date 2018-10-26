//
//  RosterScreenViewController.swift
//  statTrackerApp
//
//  Created by Nikoloz (Nick) Chkonia on 10/25/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit

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
    
    //init@0: this will be populated with players
    var playerArray = [""]
    
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
        cellBuffer += "\(studentID) "
        cellBuffer += "\(lastName) "
        cellBuffer += "\(number) "
        
        // append to array that will populate the tableView
        playerArray.append(cellBuffer)
        
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
            cell.textLabel?.text = playerArray[indexPath.row]
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // lets us edit rows for deletion
        return true
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

