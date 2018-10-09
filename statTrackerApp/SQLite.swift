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
    }
    
    func getStatTableCSV()->String{
        let sql = "select * from playerStats"
        if sqlite3_prepare(db, sql, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return "ERROR"
        }
        var csv = "Number, Name, IceTime, ShotsFor, ShotsForTaken, ShotsAgainst, GoalsFor, GoalForTaken, GoalAgainst\n"
        
        //, ShotsFor, ShotsForTaken, ShotsAgainst, goalsFor, goalsForTaken, goalsAgainst\n"
        while(sqlite3_step(stmt) == SQLITE_ROW){
            //print (stmt!)
            let number = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let icetime = String(cString: sqlite3_column_text(stmt, 2))
            let shotFor = sqlite3_column_int(stmt, 3)
            let shotForTaken = sqlite3_column_int(stmt, 4)
            let shotAgainst = sqlite3_column_int(stmt, 5)
            let goalFor = sqlite3_column_int(stmt, 6)
            let goalForTaken = sqlite3_column_int(stmt, 7)
            let goalAgainst = sqlite3_column_int(stmt, 8)
            let newline = "\(number),\(name),\(icetime),\(shotFor),\(shotForTaken),\(shotAgainst),\(goalFor),\(goalForTaken),\(goalAgainst)\n"
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












