//
//  ViewController.swift
//  IRIS
//
//  Created by Rahman Mammadov on 3/8/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit
import MessageUI

class EnteranceViewController: BaseViewController {

    static public let SEGUE_KEY_CALCULATORS: String = "goCalculators"
    static public let SEGUE_KEY_USER_GUIDE: String = "goUserGuide"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 48.0/255.0, green: 63.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCalculators(_ sender: Any) {
        performSegue(withIdentifier: EnteranceViewController.SEGUE_KEY_CALCULATORS, sender: self)
    }
    
    @IBAction func btnUserGuide(_ sender: Any) {
        performSegue(withIdentifier: EnteranceViewController.SEGUE_KEY_USER_GUIDE, sender: self)
    }
    
    @IBAction func btnFeedback(_ sender: Any) {
        sendEmail()
    }
    
    func sendEmail() {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([])
        mailVC.setSubject("Subject for email")
        mailVC.setMessageBody("Email message string", isHTML: false)
        
        present(mailVC, animated: true, completion: nil)
    }

}

extension EnteranceViewController: MFMailComposeViewControllerDelegate {
    
}

