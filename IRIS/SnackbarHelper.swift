//
//  SnackbarHelped.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/17/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialSnackbar

class SnackbarHelper {
    
    clas func showSnackbar(text: String) {
        let message = MDCSnackbarMessage()
        message.text = text
        MDCSnackbarManager.show(message)
    }
}
