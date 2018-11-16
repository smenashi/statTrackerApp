//
//  EmailHandler.swift
//  statTrackerApp
//
//  Created by Chad Morse on 10/4/18.
//  Copyright © 2018 Sophie Menashi. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    var currentOpponent: String? = "Game"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let chronStats = appDelegate.database?.getChronStatTableCSV()
        let gameStats = appDelegate.database?.getGameStatTableCSV()
        //sendEmail(data: (a?.data(using: .utf8))!)
        //let emailer = EmailViewController()
        
       
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self as MFMailComposeViewControllerDelegate
        // Configure the fields of the interface.
        composeVC.setToRecipients(["cmorse529@gmail.com"])
        composeVC.setSubject("\(currentOpponent ?? "") Game Summary")
        composeVC.setMessageBody("Statistics attached", isHTML: false)
        composeVC.addAttachmentData((chronStats?.data(using: .utf8))!, mimeType: "text/csv", fileName: "\(currentOpponent ?? "Game")_Play_By_Play.csv")
        composeVC.addAttachmentData((gameStats?.data(using: .utf8))!, mimeType: "text/csv", fileName: "\(currentOpponent ?? "Game")_Stats.csv")
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
 
    }
    
    func sendEmail(data: Data) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["cmorse529@gmail.com"])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello this is my message body!", isHTML: false)
        composeVC.addAttachmentData(data, mimeType: "text/csv", fileName: "a.csv")
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

