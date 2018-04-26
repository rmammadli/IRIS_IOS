//
//  Constant.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/23/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit

class Constant {
    
    //------------- Defaults ---------------------------------------------------
    
    struct  DefaultValues {
        static let doubleRoundFormat: String =  "%.2f"
        static let doubleTFDefault: Double =  -99.0
    }
    
    struct  Color {
        static let colorBlue: UIColor = UIColor(red: 48.0/255.0, green: 63.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        static let colorGrey: UIColor = UIColor(red: 126.0/255.0, green: 87.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        static let colorRed: UIColor = UIColor(red: 211.0/255.0, green: 47.0/255.0, blue: 47.0/255.0, alpha: 1.0)
    }
    
    struct DefaultValuesRiskCalculator {
        static let arrayCellTypes: Array = [0, 0, 1, 0, 0, 0]
        static let arrayTitles: Array = ["• Previous childbirth (Multiparous)?", "• Gestational age ≥39⁺⁰ at the TIME of delivery?", "• Cerebroplacental ratio MoM", "• Induced labor?", "• Labor augmentation?", "• Epidural analgesia?"]
        static let arrayPlaceHolders: Array = ["", "", "from 0.0 to 3.0", "", "", ""]
        static let arrayInputTypes: Array = [nil, nil, UIKeyboardType.decimalPad, nil, nil, nil]
        static var arrayInputValues: [Double] = [0.0, 0.0, DefaultValues.doubleTFDefault, 0.0, 0.0, 0.0]
        static var arrayEmptyMessages: Array = [" ", " ", "Add CPR MOM value please!", " ", " ", " "]
        static var arrayErrorMessages: Array = [" ", " ", "CPR MOM value should be between 0.0 and 3.0!", " ", " ", " "]
        static var textResultMessage: String = "The risk of operative delivery is \n"
    }
    
    struct DefaultValuesCPRMoM {
        static let arrayTitles: Array = ["• Gestational age (weeks)", "• Gestational age (days)", "• Cerebroplacental ratio value"]
        static let arrayPlaceHolders: Array = ["number from 36 to 42", "number from 0 to 6", "num"]
        static let arrayInputTypes: Array = [UIKeyboardType.decimalPad, UIKeyboardType.decimalPad, UIKeyboardType.decimalPad]
        static var arrayInputValues: Array = [DefaultValues.doubleTFDefault, DefaultValues.doubleTFDefault, DefaultValues.doubleTFDefault]
        static var arrayEmptyMessages: Array = ["Fill the fields please", "Fill the fields please", "Fill the fields please"]
        static var arrayErrorMessages: Array = ["Gestational age(weeks) value should be between 36 and 42", "Gestational age(days) value should be between 0 and 6", " "]
        static var textResultMessage: String = "Cerebroplacental ratio MoM is \n"
    }
    
    //------------- Messages ---------------------------------------------------
    struct  Messages {
        
    }
}
