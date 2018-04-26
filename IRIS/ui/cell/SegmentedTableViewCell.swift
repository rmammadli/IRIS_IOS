//
//  SegmentedTableViewCell.swift
//  IRIS
//
//  Created by Rahman Mammadov on 4/9/18.
//  Copyright © 2018 com.newolab. All rights reserved.
//

import UIKit
import MaterialComponents

class SegmentedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var btnNo: MDCRaisedButton!
    @IBOutlet weak var btnYes: MDCRaisedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
