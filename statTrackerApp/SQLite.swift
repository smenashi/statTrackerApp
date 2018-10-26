//
//  SQLite.swift
//  statTrackerApp
//
//  Created by Chad Morse on 10/4/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import SQLite3
import MessageUI

class SQLiteDB {
    //possibly use the sqlite3_step() function at some point to make easier
    var db: OpaquePointer?
    var stmt: OpaquePointer?
    var errorMsg: String?
    var filePath: String?
    
    init(fileName: String) { //parameter must end in ".sqlite"
        //connets db pointer to newly created database
        let databaseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(fileName)
        if sqlite3_open(databaseURL.path, &db) != SQLITE_OK {
            print("Error opening database connection")
        }
        else {
            print("Succussfully opened database")
            //print(databaseURL)
            self.filePath = databaseURL.path
            createStatTable()
            //getStatTableCSV()
        }
    }
    
    func createStatTable(){
        //can add season game time
        executeNoReturn(execCommand: "create table if not exists playerStats(number INT PRIMARY KEY, name TEXT NOT NULL, iceTime text NOT NULL, shotsFor INT NOT NULL, shotsForTaken INT NOT NULL, shotsAgainst INT NOT NULL, goalsFor INT NOT NULL, goalsForTaken INT NOT NULL, goalsAgainst INT NOT NULL)")
        executeNoReturn(execCommand: "create table if not exists currentRoster(studentID INT PRIMARY KEY, lastName TEXT NOT NULL, number INT NOT NULL, position INT NOT NULL)")
        //let sql = "replace into currentRoster(studentID, lastName, number, position) values (1, \"Player1\", 1, 1), (2, \"Player2\", 2, 2), (3, \"Player3\", 3, 3), (4, \"Player4\", 4, 4), (5, \"Player5\", 5, 5), (6, \"Player6\", 6, 6), (7, \"Player7\", 7, 7), (8, \"Player8\", 8, 8), (9, \"Player9\", 9, 9), (10, \"Player10\", 10, 10), (11, \"Player11\", 11, 11), (12, \"Player12\", 12, 12), (13, \"Player13\", 13, 13), (14, \"Player14\", 14, 14), (15, \"Player15\", 15, 15), (16, \"Player16\", 16, 16), (17, \"Player17\", 17, 17), (18, \"Player18\", 18, 18), (19, \"Player19\", 19, 19), (20, \"Player20\", 20, 20), (21, \"Player21\", 21, 21), (22, \"Player22\", 22, 22)"
        //executeNoReturn(execCommand: sql)
    }
    
    func getCurrentRoster()->[rosterPlayer]{
        var currentRoster: [rosterPlayer] = []
        let sql = "select * from currentRoster"
        sqlite3_prepare(db, sql, -1, &stmt, nil)
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let studentID = sqlite3_column_int(stmt, 0)
            let lastName = String(cString: sqlite3_column_text(stmt, 1))
            let number = sqlite3_column_int(stmt, 2)
            let position = sqlite3_column_int(stmt, 3)
            currentRoster.append(rosterPlayer(studentID: Int(studentID), lastName: lastName, number: Int(number), position: Int(position)))
        }
        return currentRoster
    }
    
    func getStatTableCSV()->String{
        let sql = "select * from playerStats"
        if sqlite3_prepare(db, sql, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return "ERROR"
        }
        var csv = "Number, Name, IceTime, ShotsFor, ShotsForTaken, ShotsAgainst, GoalsFor, GoalForTaken, GoalAgainst, +/-, Shot +/-, Corsi\n"
        
        //, ShotsFor, ShotsForTaken, ShotsAgainst, goalsFor, goalsForTaken, goalsAgainst\n"
        while(sqlite3_step(stmt) == SQLITE_ROW){
            //print (stmt!)
            let number = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let icetime = sqlite3_column_int(stmt, 2)
            let icetimeStr = String(format:"%02i:%02i", icetime/60, icetime%60)
            let shotFor = sqlite3_column_int(stmt, 3)
            let shotForTaken = sqlite3_column_int(stmt, 4)
            let shotAgainst = sqlite3_column_int(stmt, 5)
            let goalFor = sqlite3_column_int(stmt, 6)
            let goalForTaken = sqlite3_column_int(stmt, 7)
            let goalAgainst = sqlite3_column_int(stmt, 8)
            let plusMinus = goalFor - goalAgainst
            let shotPlusMinus = shotFor - shotAgainst
            var corsi = 0
            if icetime != 0{
                corsi = Int(shotPlusMinus * (3600/icetime))
            }
            let newline = "\(number),\(name),\(icetimeStr),\(shotFor),\(shotForTaken),\(shotAgainst),\(goalFor),\(goalForTaken),\(goalAgainst),\(plusMinus),\(shotPlusMinus),\(corsi)\n"
            csv.append(contentsOf: newline)
        }
        return csv
        
    }
    
    
    func connectDatabase(filePath: String) {
        //connects db pointer to database at path filePath
        if sqlite3_open(filePath, &db) != SQLITE_OK {
            print("Error accessing DB at: "+filePath)
        }
        else {
            print("Successfully connected to DB at: "+filePath)
        }
    }
    
    func executeNoReturn(execCommand: String) {
        //executes the passed string without returning anything (create/insert)
        if sqlite3_exec(db, execCommand, nil, nil, nil) != SQLITE_OK {
            errorMsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: "+errorMsg!)
        }
        else {
            print("\""+execCommand+"\" executed successfully.")
        }
    }
    
    
    
}












