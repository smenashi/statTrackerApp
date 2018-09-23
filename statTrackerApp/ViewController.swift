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
    
    // Game Clock ///////////////////////////
    @IBOutlet weak var gameClock: UIButton!
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
    @IBOutlet weak var shotFor_button: UIButton!
    @IBOutlet weak var shotAgainst_button: UIButton!
    @IBOutlet weak var goalsFor_button: UIButton!
    @IBOutlet weak var goalAgainst_button: UIButton!
    @IBOutlet weak var penalties_button: UIButton!
    /////////////////////////////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

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

