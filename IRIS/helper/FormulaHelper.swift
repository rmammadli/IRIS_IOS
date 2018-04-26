//
//  FormulaHelper.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/27/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import Foundation

class FormulaHelper {
    
    class func calculateRisk(arrayValues: Array<Double>) -> String {
        let multiplyResult = 1.0 * (-1.62033945) + arrayValues[3] * 0.8190732 + arrayValues[4] * 1.1306108 + arrayValues[5] * 1.0043770 + arrayValues[1] * 0.5056318 + arrayValues[2] * (-1.0388667) + arrayValues[0] * (-1.0065461) + (-0.8435302) * arrayValues[3] * arrayValues[4];
        let result = ( 1 /  (1 + pow(M_E, (-1) * multiplyResult))) * 100;
        
        return String(format: Constant.DefaultValues.doubleRoundFormat, result) + "%"
    }
    
    class func calculateCPRMoM(arrayValues: Array<Double>) -> String {
        let hh = arrayValues[0] + (arrayValues[1] / 7);
        let result = arrayValues[2] / (-1.3841 + 0.22659 * hh - 0.003743 * pow(hh, 2));
        
        return String(format: Constant.DefaultValues.doubleRoundFormat, result)
    }
}
