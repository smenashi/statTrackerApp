//
//  MainMenuViewController.swift
//  statTrackerApp
//
//  Created by Nikoloz (Nick) Chkonia on 10/25/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import UIKit

// NOTE: this is tied to the Main Menu Screen in HockeyUI.storyboard
class MainMenuViewController: UIViewController {

    // reference to input buffer
    @IBOutlet weak var inputCollege: UITextField!
    
    // prepare inputCollege text to be sent to ViewController.swift
    // ref: https://matteomanferdini.com/how-ios-view-controllers-communicate-with-each-other/
    // ref: https://www.youtube.com/watch?v=HzKcLccB8FI
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController{
            let vc = segue.destination as? ViewController
            vc?.inputCollegeText = inputCollege.text
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
