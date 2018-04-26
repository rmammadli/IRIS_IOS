//
//  ShowTextViewController.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/13/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit

class ShowTextViewController: UIViewController {

    public var index: Int = 0
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
         setData(dataIndex: index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(dataIndex: Int) {
        switch dataIndex {
        case 0:
            self.navigationItem.title = "Disclaimer"
            labelTitle.text = "Disclaimer"
            labelContent.text = "The use of this application does not establish a relationship between you and the IRIS developer team or any of affiliated body. Every effort has been made to ensure that all calculations are entirely accurate, however calculation accuracy is not guaranteed and the IRIS developer team accepts no liability for any calculation error. The IRIS developer team holds no claims to the clinical validity or plausibility of generated results and it is your responsibility to interpret the generated results.  The application is not a substitute for medical advice or diagnosis.  The IRIS developer team accepts no liability for your use of this application and advise that your use is at your own risk. It is your responsibility to ensure you are using the most up-to-date version to accommodate evolving changes in best practice and evidence base."
            break
        case 1:
            self.navigationItem.title = "Terms of use"
            labelTitle.text = "Terms of use"
            labelContent.text = "By using this application you acknowledge that you are over 18 years of age and are a health, allied health or health research professional.  This application is not designed for use by patients, general public, or those under the age of 18 years. By using this application you acknowledge full responsibility and liability pertaining to your use and any courses of action you take as a direct or indirect result of using the application.    "
            break
        case 2:
            self.navigationItem.title = "References"
            labelTitle.text = "References"
            labelContent.text = "- Operative delivery \nhttp://dx.doi.org/10.1016/j.ajog.2017.10.022 \n\n- Neonatal unit admission \nhttps://doi.org/10.1080/14767058.2018.1437412 \n\n- Cerebroplacental ratio MoM \nhttps://doi.org/10.1002/uog.13319  \n\n- How to measure middle-cerebral artery and umbilical artery Doppler. \nhttps://doi.org/10.1002/uog.12371"
            break
        case 3:
            self.navigationItem.title = "About"
            labelTitle.text = "The IRIS tool"
            labelContent.text = "The Intrapartum RIsk aSsessment tool for small-for-gestational age babies is a mobile application aimed at obstetricians dealing with deliveries of high-risk fetuses. The IRIS tool has three calculators which are built for estimating the risk of operative delivery due to intrapartum fetal distress, estimating the risk of prolonged neonatal unit admission and calculating cerebroplacental ratio MoMs. The coefficients used by the risk calculators are derived from a population of suspected small for gestational age fetuses who delivered in St. George’s University Hospital in London.  Associated literature can be found in the references section. Understanding the limitations of such studies and the information they may provide is essential before starting to use the IRIS tool. Although the term “prediction model” is commonly used for such studies, it is sort of a misnomer. Rather than actually predicting an outcome which implies this calculator is optimized for your clinical setting, the “predictions” of IRIS tool are optimized for the analyzed cohort (St. George’s University of London). It is important to note that your local practices may not be accounted for in the calculations of IRIS tool. We sincerely hope you will find the IRIS tool practical and beneficial in your daily practice and please give us your feedback via Contribute/Collaborate link in the main menu. \n\nYours sincerely,\nIRIS developer team"
            break
        default: break
        }
        
        labelContent.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelContent.numberOfLines = 0
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
