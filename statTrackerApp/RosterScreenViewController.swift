//
//  RosterScreenViewController.swift
//  statTrackerApp
//
//  Created by Nikoloz (Nick) Chkonia on 10/25/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit

class rosterPlayer {
    var studentID: Int
    var lastName: String
    var number: Int
    var position: Int //numbers here correspond to boxes - i.e. 1 is top left, 2 top middle, etc (0=inactive)
    
    init(studentID: Int, lastName: String, number: Int, position: Int) {
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
    //@IBOutlet weak var removePlayer: UIButton!
    @IBOutlet weak var addPlayer: UIButton!
    @IBOutlet weak var next_name: UIButton!
    @IBOutlet weak var next_number: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var SaveExitButton: UIButton!
    
    //input labels
    @IBOutlet weak var enterStudID: UILabel!
    @IBOutlet weak var enterLastName: UILabel!
    @IBOutlet weak var enterJerseyNum: UILabel!
    
    //input fields
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var inputStudID: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputJerseyNum: UITextField!
    
    //cosmetic touch for when add player is clicked
    @IBOutlet weak var opaqueFilter: UIImageView!
    
    
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
    
    //need to make the logic better- can only "put a player to position" if its empty.
    
    //actions on roster buttons clicked, adds currently selected player to that spot
    @IBAction func P1Clicked(_ sender: Any) {
        if(p1 != nil){
            p1?.position = 0
            p1 = nil
            F11Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p1 = currentSelectedPlayer
            p1?.position = 1
            F11Button.setTitle(p1?.lastName, for: .normal)
        }
    }
    @IBAction func P2Clicked(_ sender: Any) {
        if(p2 != nil){
            p2?.position = 0
            p2 = nil
            F12Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p2 = currentSelectedPlayer
            p2?.position = 2
            F12Button.setTitle(p2?.lastName, for: .normal)
        }
    }
    @IBAction func P3Clicked(_ sender: Any) {
        if(p3 != nil){
            p3?.position = 0
            p3 = nil
            F13Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p3 = currentSelectedPlayer
            p3?.position = 3
            F13Button.setTitle(p3?.lastName, for: .normal)
        }
    }
    @IBAction func P4Clicked(_ sender: Any) {
        if(p4 != nil){
            p4?.position = 0
            p4 = nil
            F21Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p4 = currentSelectedPlayer
            p4?.position = 4
            F21Button.setTitle(p4?.lastName, for: .normal)
        }
    }
    @IBAction func P5Clicked(_ sender: Any) {
        if(p5 != nil){
            p5?.position = 0
            p5 = nil
            F22Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p5 = currentSelectedPlayer
            p5?.position = 5
            F22Button.setTitle(p5?.lastName, for: .normal)
        }
    }
    @IBAction func P6Clicked(_ sender: Any) {
        if(p6 != nil){
            p6?.position = 0
            p6 = nil
            F23Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p6 = currentSelectedPlayer
            p6?.position = 6
            F23Button.setTitle(p6?.lastName, for: .normal)
        }
    }
    @IBAction func P7Clicked(_ sender: Any) {
        if(p7 != nil){
            p7?.position = 0
            p7 = nil
            F31Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p7 = currentSelectedPlayer
            p7?.position = 7
            F31Button.setTitle(p7?.lastName, for: .normal)
        }
    }
    @IBAction func P8Clicked(_ sender: Any) {
        if(p8 != nil){
            p8?.position = 0
            p8 = nil
            F32Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p8 = currentSelectedPlayer
            p8?.position = 8
            F32Button.setTitle(p8?.lastName, for: .normal)
        }
    }
    @IBAction func P9Clicked(_ sender: Any) {
        if(p9 != nil){
            p9?.position = 0
            p9 = nil
            F33Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p9 = currentSelectedPlayer
            p9?.position = 9
            F33Button.setTitle(p9?.lastName, for: .normal)
        }
    }
    @IBAction func P10Clicked(_ sender: Any) {
        if(p10 != nil){
            p10?.position = 0
            p10 = nil
            F41Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p10 = currentSelectedPlayer
            p10?.position = 10
            F41Button.setTitle(p10?.lastName, for: .normal)
        }
    }
    @IBAction func P11Clicked(_ sender: Any) {
        if(p11 != nil){
            p11?.position = 0
            p11 = nil
            F42Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p11 = currentSelectedPlayer
            p11?.position = 11
            F42Button.setTitle(p11?.lastName, for: .normal)
        }
    }
    @IBAction func P12Clicked(_ sender: Any) {
        if(p12 != nil){
            p12?.position = 0
            p12 = nil
            F43Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p12 = currentSelectedPlayer
            p12?.position = 12
            F43Button.setTitle(p12?.lastName, for: .normal)
        }
    }
    @IBAction func P13Clicked(_ sender: Any) {
        if(p13 != nil){
            p13?.position = 0
            p13 = nil
            D11Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p13 = currentSelectedPlayer
            p13?.position = 13
            D11Button.setTitle(p13?.lastName, for: .normal)
        }
    }
    @IBAction func P14Clicked(_ sender: Any) {
        if(p14 != nil){
            p14?.position = 0
            p14 = nil
            D12Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p14 = currentSelectedPlayer
            p14?.position = 14
            D12Button.setTitle(p14?.lastName, for: .normal)
        }
    }
    @IBAction func P15Clicked(_ sender: Any) {
        if(p15 != nil){
            p15?.position = 0
            p15 = nil
            D21Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p15 = currentSelectedPlayer
            p15?.position = 15
            D21Button.setTitle(p15?.lastName, for: .normal)
        }
    }
    @IBAction func P16Clicked(_ sender: Any) {
        if(p16 != nil){
            p16?.position = 0
            p16 = nil
            D22Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p16 = currentSelectedPlayer
            p16?.position = 16
            D22Button.setTitle(p16?.lastName, for: .normal)
        }
    }
    @IBAction func P17Clicked(_ sender: Any) {
        if(p17 != nil){
            p17?.position = 0
            p17 = nil
            D31Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p17 = currentSelectedPlayer
            p17?.position = 17
            D31Button.setTitle(p17?.lastName, for: .normal)
        }
    }
    @IBAction func P18Clicked(_ sender: Any) {
        if(p18 != nil){
            p18?.position = 0
            p18 = nil
            D32Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p18 = currentSelectedPlayer
            p18?.position = 18
            D32Button.setTitle(p18?.lastName, for: .normal)
        }
    }
    @IBAction func P22Clicked(_ sender: Any) {
        if(p22 != nil){
            p22?.position = 0
            p22 = nil
            X1Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p22 = currentSelectedPlayer
            p22?.position = 22
            X1Button.setTitle(p22?.lastName, for: .normal)
        }
    }
    @IBAction func P19Clicked(_ sender: Any) {
        if(p19 != nil){
            p19?.position = 0
            p19 = nil
            G1Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p19 = currentSelectedPlayer
            p19?.position = 1
            G1Button.setTitle(p19?.lastName, for: .normal)
        }
    }
    @IBAction func P20Clicked(_ sender: Any) {
        if(p20 != nil){
            p20?.position = 0
            p20 = nil
            G2Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p20 = currentSelectedPlayer
            p20?.position = 1
            G2Button.setTitle(p20?.lastName, for: .normal)
        }
    }
    @IBAction func P21Clicked(_ sender: Any) {
        if(p21 != nil){
            p21?.position = 0
            p21 = nil
            G3Button.setTitle("EMPTY", for: .normal)
        }
        else if(currentSelectedPlayer?.position == 0){
            p21 = currentSelectedPlayer
            p21?.position = 21
            G3Button.setTitle(p21?.lastName, for: .normal)
        }
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
        //flushes input prompts once done is clicked
        inputField.text = ""
        inputStudID.text = ""
        inputLastName.text = ""
        inputJerseyNum.text = ""
    }
    
    func insertStudentID(){
        // saves info from input in studentID var
        //studentID.append(inputField.text!)
        studentID.append(inputStudID.text!)
        //flushInput()
    }
    
    func insertPlayerName(){
        // saves info from input to lastName var
//        lastName.append(inputField.text!)
        lastName.append(inputLastName.text!)
        //flushInput()
    }
    
    func insertPlayerNumber(){
        // saves info from input to number var
//        number.append(inputField.text!)
        number.append(inputJerseyNum.text!)
        //flushInput()
    }
    
    @IBAction func addPlayerClicked(_ sender: Any) {
       // inputField.isHidden = false
        // display input fields
        inputStudID.isHidden = false
        inputLastName.isHidden = false
        inputJerseyNum.isHidden = false
        // display done button
        doneButton.isHidden = false
        // place filter
        opaqueFilter.isHidden = false
       // enterStudID.isHidden = false
       // next_name.isHidden = false
    }

    // these are depricated xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    @IBAction func next_nameClicked(_ sender: Any) {
        // input from studentId is processed
        insertStudentID()
        enterStudID.isHidden = true
        enterLastName.isHidden = false
        next_name.isHidden = true
        next_number.isHidden = false
    }

    @IBAction func next_numberClicked(_ sender: Any) {
        // input for lastName processed
        insertPlayerName()
        enterLastName.isHidden = true
        enterJerseyNum.isHidden = false
        next_number.isHidden = true
      //  doneButton.isHidden = false
    }
    // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    
    @IBAction func doneButtonClicked(_ sender: Any) {
       // when user clicks the done button, input values are handled,
       // buffer gets flushed to table and cleared
       // relevant UI elements are cleared from screen
        
        // inputs are handled
        insertStudentID()
        insertPlayerName()
        insertPlayerNumber()
        print("TESTAKLES")
        print(lastName)
        print(number)
        
        enterJerseyNum.isHidden = true
        inputField.isHidden = true
        doneButton.isHidden = true
        // hide opaque filter
        opaqueFilter.isHidden = true
        // hide input fields
        inputStudID.isHidden = true
        inputLastName.isHidden = true
        inputJerseyNum.isHidden = true
        // append variables to cellBuffer
        //cellBuffer += "\(studentID) "
        //cellBuffer += "\(lastName) "
        //cellBuffer += "\(number) "
        
        playerArray.append(rosterPlayer(studentID: Int(studentID) ?? 0, lastName: lastName, number: Int(number) ?? 0, position: 0))
        
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
    @IBAction func SaveExitClicked(_ sender: Any) {
        var sql:String
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        sql = "delete from currentRoster"
        appDelegate.database?.executeNoReturn(execCommand: sql)
        for player in playerArray {
            //replace when DB already works (for now temp fix)
            sql = "insert into currentRoster(studentID, lastName, number, position) values( \(player.studentID), \"\(player.lastName)\", \(player.number), \(player.position))"
            //print(sql)
            appDelegate.database?.executeNoReturn(execCommand: sql)
            
        }
    }
    
    

    
  //  @IBAction func removePlayerClicked(_ sender: Any) {
    //}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide buttons for input handling
        doneButton.isHidden = true
        next_name.isHidden = true
        next_number.isHidden = true
        
        // hide input bars when loaded
        inputField.isHidden = true
        inputStudID.isHidden = true
        inputLastName.isHidden = true
        inputJerseyNum.isHidden = true
        
        // hide input labels
        enterStudID.isHidden = true
        enterLastName.isHidden = true
        enterJerseyNum.isHidden = true
        
        //hide opaque filter
        opaqueFilter.isHidden = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        playerArray = appDelegate.database?.getCurrentRoster() ?? []
        for player in playerArray{
            if player.position == 1{
                p1 = player
                F11Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 2{
                p2 = player
                F12Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 3{
                p3 = player
                F13Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 4{
                p4 = player
                F21Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 5{
                p5 = player
                F22Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 6{
                p6 = player
                F23Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 7{
                p7 = player
                F31Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 8{
                p8 = player
                F32Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 9{
                p9 = player
                F33Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 10{
                p10 = player
                F41Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 11{
                p11 = player
                F42Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 12{
                p12 = player
                F43Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 13{
                p13 = player
                D11Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 14{
                p14 = player
                D12Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 15{
                p15 = player
                D21Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 16{
                p16 = player
                F22Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 17{
                p17 = player
                D31Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 18{
                p18 = player
                D32Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 19{
                p19 = player
                G1Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 20{
                p20 = player
                G2Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 21{
                p21 = player
                G3Button.setTitle(player.lastName, for: .normal)
            }
            else if player.position == 22{
                p22 = player
                X1Button.setTitle(player.lastName, for: .normal)
            }
        }
        
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

