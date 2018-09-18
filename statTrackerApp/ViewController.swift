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
    @IBOutlet weak var Line1: UIButton!
    @IBOutlet weak var Line2: UIButton!
    @IBOutlet weak var Line3: UIButton!
    @IBOutlet weak var Line4: UIButton!
    @IBOutlet weak var Line5: UIButton!
    @IBOutlet weak var Line6: UIButton!
    @IBOutlet weak var Line7: UIButton!
    @IBOutlet weak var Line8: UIButton!
    @IBOutlet weak var Line9: UIButton!
    @IBOutlet weak var Line10: UIButton!
    /////////////////////////////////////////
    
    // Event buttons ////////////////////////
    @IBOutlet weak var Event1: UIButton!
    @IBOutlet weak var Event2: UIButton!
    @IBOutlet weak var Event3: UIButton!
    @IBOutlet weak var Event4: UIButton!
    @IBOutlet weak var Event5: UIButton!
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

