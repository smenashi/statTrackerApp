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
        //executeNoReturn(execCommand: "create table if not exists playerStatsByGame(rowID INTEGER PRIMARY KEY AUTOINCREMENT, seasonYear INTEGER NOT NULL, game TEXT NOT NULL, playerSID INTEGER NOT NULL, iceTime I)")
        //executeNoReturn(execCommand: "drop table currentRoster")
        executeNoReturn(execCommand: "create table if not exists currentRoster(rosterID INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT NOT NULL, lastName TEXT NOT NULL, number INTEGER NOT NULL, position INTEGER NOT NULL)")
        
        executeNoReturn(execCommand: "drop table gameStats")
        executeNoReturn(execCommand: "create table if not exists gameStats(statID INTEGER PRIMARY KEY AUTOINCREMENT, game TEXT NOT NULL, firstName TEXT NOT NULL, lastName TEXT NOT NULL, number INTEGER NOT NULL, totIceTime INTEGER NOT NULL, totShots INTEGER NOT NULL, totGoals INTEGER NOT NULL,  totPIMMinus REAL NOT NULL, totPIMPlus REAL NOT NULL, totPIMPlusMinus REAL NOT NULL, FiveFiveCorsiPlus REAL NOT NULL, FiveFiveCorsiMinus REAL NOT NULL, FiveFiveCorsiPlusMinus REAL NOT NULL, FiveFiveIndivShotsCorsi REAL NOT NULL, FiveFiveIcingPlus REAL NOT NULL, FiveFiveIcingMinus REAL NOT NULL, FiveFiveIcingPlusMinus REAL NOT NULL, FiveFiveIndivIcingCorsi REAL NOT NULL, FiveFourCorsiPlus REAL NOT NULL, FiveFourCorsiMinus REAL NOT NULL, FiveFourCorsiPlusMinus REAL NOT NULL, FourFiveCorsiPlus INTEGER NOT NULL, FourFiveCorsiMinus REAL NOT NULL, FourFiveCorsiPlusMinus REAL NOT NULL, FourFourCorsiPlus REAL NOT NULL, FourFourCorsiMinus REAL NOT NULL, FourFourCorsiPlusMinus REAL NOT NULL, FiveThreeCorsiPlus REAL NOT NULL, FiveThreeCorsiMinus REAL NOT NULL, FiveThreeCorsiPlusMinus REAL NOT NULL, ThreeFiveCorsiPlus REAL NOT NULL, ThreeFiveCorsiMinus REAL NOT NULL, ThreeFiveCorsiPlusMinus REAL NOT NULL, FourThreeCorsiPlus REAL NOT NULL, FourThreeCorsiMinus REAL NOT NULL, FourThreeCorsiPlusMinus REAL NOT NULL, ThreeFourCorsiPlus REAL NOT NULL, ThreeFourCorsiMinus REAL NOT NULL, ThreeFourCorsiPlusMinus REAL NOT NULL, ThreeThreeCorsiPlus REAL NOT NULL, ThreeThreeCorsiMinus REAL NOT NULL, ThreeThreeCorsiPlusMinus REAL NOT NULL)")
        executeNoReturn(execCommand: "drop table chronGameStats")
        executeNoReturn(execCommand: "create table if not exists chronGameStats( statID INTEGER PRIMARY KEY AUTOINCREMENT, seasonYear INTEGER NOT NULL, game TEXT NOT NULL, period INTEGER NOT NULL, time INTEGER NOT NULL, statType TEXT NOT NULL, manpower TEXT NOT NULL, statOwnerNum INTEGER NOT NULL, onIce1Num INTEGER NOT NULL, onIce2Num INTEGER NOT NULL, onIce3Num INTEGER NOT NULL, onIce4Num INTEGER NOT NULL, onIce5Num INTEGER NOT NULL, onIce6Num NOT NULL)")
        //in chrongamestats, SID of 0 means nobody

    }
    
    func getGameStatTableCSV()->String{
        let sql = "select game, firstName, lastName, number, totIceTime, totShots, totGoals, totPIMMinus, totPIMPlus, totPIMPlusMinus, FiveFiveCorsiPlus, FiveFiveCorsiMinus, FiveFiveCorsiPlusMinus, FiveFiveIndivShotsCorsi, FiveFiveIcingPlus, FiveFiveIcingMinus, FiveFiveIcingPlusMinus, FiveFiveIndivIcingCorsi, FiveFourCorsiPlus, FiveFourCorsiMinus, FiveFourCorsiPlusMinus, FourFiveCorsiPlus, FourFiveCorsiMinus, FourFiveCorsiPlusMinus, FiveThreeCorsiPlus, FiveThreeCorsiMinus, FiveThreeCorsiPlusMinus, ThreeFiveCorsiPlus, ThreeFiveCorsiMinus, ThreeFiveCorsiPlusMinus, FourFourCorsiPlus, FourFourCorsiMinus, FourFourCorsiPlusMinus, FourThreeCorsiPlus, FourThreeCorsiMinus, FourThreeCorsiPlusMinus, ThreeFourCorsiPlus, ThreeFourCorsiMinus, ThreeFourCorsiPlusMinus, ThreeThreeCorsiPlus, ThreeThreeCorsiMinus, ThreeThreeCorsiPlusMinus from gameStats"
        if sqlite3_prepare(db, sql, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return "ERROR"
        }
        var csv = "\"0\" = absence of player\nGame, Player, Number, TOI, Shots, Goals, PIM -/60, PIM +/60, PIM +/-/60, 5v5 Corsi +/60, 5v5 Corsi -/60, 5v5 Corsi +/-/60, 5v5 Indiv. Shots/60, 5v5 Icing +/60, 5v5 Icing -/60, 5v5 Icing +/-/60, 5v5 Indiv. Icing/60, 5v4 Corsi +/60, 5v4 Corsi -/60, 5v4 Corsi +/-/60, 4v5 Corsi +/60, 4v5 Corsi -/60, 4v5 Corsi +/-/60, 5v3 Corsi +/60, 5v3 Corsi -/60, 5v3 Corsi +/-/60, 3v5 Corsi +/60, 3v5 Corsi -/60, 3v5 Corsi +/-/60, 4v4 Corsi +/60, 4v4 Corsi -/60, 4v4 Corsi +/-/60, 4v3 Corsi +/60, 4v3 Corsi -/60, 4v3 Corsi +/-/60, 3v4 Corsi +/60, 3v4 Corsi -/60, 3v4 Corsi +/-/60, 3v3 Corsi +/60, 3v3 Corsi -/60, 3v3 Corsi +/-/60\n"
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let game = String(cString: sqlite3_column_text(stmt, 0))
            let player = String(cString: sqlite3_column_text(stmt, 1)) + " " + String(cString: sqlite3_column_text(stmt, 2))
            let number = sqlite3_column_int(stmt, 3)
            let TOIseconds = sqlite3_column_int(stmt, 4)
            let TOI = String(format:"%02i:%02i", TOIseconds/60, TOIseconds%60)
            let shots = sqlite3_column_int(stmt, 5)
            let goals = sqlite3_column_int(stmt, 6)
            let PIMMinus = Float64(sqlite3_column_double(stmt, 7))
            let PIMPlus = Float64(sqlite3_column_double(stmt, 8))
            let PIMPlusMinus = Float64(sqlite3_column_double(stmt, 9))
            let FiveFiveCorsiPlus = Float64(sqlite3_column_double(stmt, 10))
            let FiveFiveCorsiMinus = Float64(sqlite3_column_double(stmt, 11))
            let FiveFiveCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 12))
            let FiveFiveIndivShots = Float64(sqlite3_column_double(stmt, 13))
            let FiveFiveIcingPlus = Float64(sqlite3_column_double(stmt, 14))
            let FiveFiveIcingMinus = Float64(sqlite3_column_double(stmt, 15))
            let FiveFiveIcingPlusMinus = Float64(sqlite3_column_double(stmt, 16))
            let FiveFiveIndivIcing = Float64(sqlite3_column_double(stmt, 17))
            let FiveFourCorsiPlus = Float64(sqlite3_column_double(stmt, 18))
            let FiveFourCorsiMinus = Float64(sqlite3_column_double(stmt, 19))
            let FiveFourCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 20))
            let FourFiveCorsiPlus = Float64(sqlite3_column_double(stmt, 21))
            let FourFiveCorsiMinus = Float64(sqlite3_column_double(stmt, 22))
            let FourFiveCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 23))
            let FiveThreeCorsiPlus = Float64(sqlite3_column_double(stmt, 24))
            let FiveThreeCorsiMinus = Float64(sqlite3_column_double(stmt, 25))
            let FiveThreeCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 26))
            let ThreeFiveCorsiPlus = Float64(sqlite3_column_double(stmt, 27))
            let ThreeFiveCorsiMinus = Float64(sqlite3_column_double(stmt, 28))
            let ThreeFiveCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 29))
            let FourFourCorsiPlus = Float64(sqlite3_column_double(stmt, 30))
            let FourFourCorsiMinus = Float64(sqlite3_column_double(stmt, 31))
            let FourFourCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 32))
            let FourThreeCorsiPlus = Float64(sqlite3_column_double(stmt, 33))
            let FourThreeCorsiMinus = Float64(sqlite3_column_double(stmt, 34))
            let FourThreeCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 35))
            let ThreeFourCorsiPlus = Float64(sqlite3_column_double(stmt, 36))
            let ThreeFourCorsiMinus = Float64(sqlite3_column_double(stmt, 37))
            let ThreeFourCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 38))
            let ThreeThreeCorsiPlus = Float64(sqlite3_column_double(stmt, 39))
            let ThreeThreeCorsiMinus = Float64(sqlite3_column_double(stmt, 40))
            let ThreeThreeCorsiPlusMinus = Float64(sqlite3_column_double(stmt, 41))
            
            
            let newline = "\(game),\(player),\(number),\(TOI),\(shots),\(goals),\(PIMMinus.roundTo(places: 3)),\(PIMPlus.roundTo(places: 3)),\(PIMPlusMinus.roundTo(places: 3)),\(FiveFiveCorsiPlus.roundTo(places: 3)),\(FiveFiveCorsiMinus.roundTo(places: 3)),\(FiveFiveCorsiPlusMinus.roundTo(places: 3)), \(FiveFiveIndivShots.roundTo(places: 3)), \(FiveFiveIcingPlus.roundTo(places: 3)), \(FiveFiveIcingMinus.roundTo(places: 3)), \(FiveFiveIcingPlusMinus.roundTo(places: 3)), \(FiveFiveIndivIcing.roundTo(places: 3)), \(FiveFourCorsiPlus.roundTo(places: 3)), \(FiveFourCorsiMinus.roundTo(places: 3)), \(FiveFourCorsiPlusMinus.roundTo(places: 3)), \(FourFiveCorsiPlus.roundTo(places: 3)), \(FourFiveCorsiMinus.roundTo(places: 3)), \(FourFiveCorsiPlusMinus.roundTo(places: 3)), \(FiveThreeCorsiPlus.roundTo(places: 3)), \(FiveThreeCorsiMinus.roundTo(places: 3)), \(FiveThreeCorsiPlusMinus.roundTo(places: 3)), \(ThreeFiveCorsiPlus.roundTo(places: 3)), \(ThreeFiveCorsiMinus.roundTo(places: 3)), \(ThreeFiveCorsiPlusMinus.roundTo(places: 3)), \(FourFourCorsiPlus.roundTo(places: 3)), \(FourFourCorsiMinus.roundTo(places: 3)), \(FourFourCorsiPlusMinus.roundTo(places: 3)), \(FourThreeCorsiPlus.roundTo(places: 3)), \(FourThreeCorsiMinus.roundTo(places: 3)), \(FourThreeCorsiPlusMinus.roundTo(places: 3)), \(ThreeFourCorsiPlus.roundTo(places: 3)), \(ThreeFourCorsiMinus.roundTo(places: 3)), \(ThreeFourCorsiPlusMinus.roundTo(places: 3)), \(ThreeThreeCorsiPlus.roundTo(places: 3)), \(ThreeThreeCorsiMinus.roundTo(places: 3)), \(ThreeThreeCorsiPlusMinus.roundTo(places: 3))\n"
            csv.append(contentsOf: newline)
        }
        return csv
        
    }
    
    func addChronStat(seasonYear:Int, game:String, period:Int, time:Int, statType:String, manpower:String, statOwnerNum:Int, onIce1Num:Int, onIce2Num:Int, onIce3Num:Int, onIce4Num:Int, onIce5Num:Int, onIce6Num:Int){
        executeNoReturn(execCommand: "insert into chronGameStats(seasonYear, game, period, time, statType, manpower, statOwnerNum, onIce1Num, onIce2Num, onIce3Num, onIce4Num, onIce5Num, onIce6Num) VALUES (\(seasonYear), \"\(game)\", \(period), \(time), \"\(statType)\", \"\(manpower)\", \(statOwnerNum), \(onIce1Num), \(onIce2Num), \(onIce3Num), \(onIce4Num), \(onIce5Num), \(onIce6Num))")
    }
    
    
    
    func getCurrentRoster()->[rosterPlayer]{
        var currentRoster: [rosterPlayer] = []
        let sql = "select * from currentRoster"
        sqlite3_prepare(db, sql, -1, &stmt, nil)
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let firstName = String(cString: sqlite3_column_text(stmt, 1))
            let lastName = String(cString: sqlite3_column_text(stmt, 2))
            let number = sqlite3_column_int(stmt, 3)
            let position = sqlite3_column_int(stmt, 4)
            currentRoster.append(rosterPlayer(firstName: firstName, lastName: lastName, number: Int(number), position: Int(position)))
            //print(firstName)
            //print(lastName)
            //print(number)
            //print(position)
            //print("&&&&&&&&&&")
        }
        return currentRoster
    }
    
    func getChronStatTableCSV()->String{
        let sql = "select game, period, time, statType, manpower, statOwnerNum, onIce1Num, onIce2Num, onIce3Num, onIce4Num, onIce5Num, onIce6Num from chronGameStats"
        if sqlite3_prepare(db, sql, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return "ERROR"
        }
        var csv = "\"0\" = absence of player\nGame, Period, Time, Event, Situation, Committed By, On Ice 1, On Ice 2, On Ice 3, On Ice 4, On Ice 5, On Ice 6\n"
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let game = String(cString: sqlite3_column_text(stmt, 0))
            let period = sqlite3_column_int(stmt, 1)
            let timeSeconds = sqlite3_column_int(stmt, 2)
            let time = String(format:"%02i:%02i", timeSeconds/60, timeSeconds%60)
            let statType = String(cString: sqlite3_column_text(stmt, 3))
            let manpower = String(cString: sqlite3_column_text(stmt, 4))
            let statOwnerNum = sqlite3_column_int(stmt, 5)
            let onIce1Num = sqlite3_column_int(stmt, 6)
            let onIce2Num = sqlite3_column_int(stmt, 7)
            let onIce3Num = sqlite3_column_int(stmt, 8)
            let onIce4Num = sqlite3_column_int(stmt, 9)
            let onIce5Num = sqlite3_column_int(stmt, 10)
            let onIce6Num = sqlite3_column_int(stmt, 11)
            let newline = "\(game),\(period),\(time),\(statType),\(manpower),\(statOwnerNum),\(onIce1Num),\(onIce2Num),\(onIce3Num),\(onIce4Num),\(onIce5Num),\(onIce6Num)\n"
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
extension Float64 {
    func roundTo(places:Int) -> Float64 {
        let divisor = pow(10.0, Float64(places))
        return (self * divisor).rounded() / divisor
    }
}












