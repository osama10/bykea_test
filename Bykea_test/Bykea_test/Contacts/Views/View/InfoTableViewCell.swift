//
//  InfoTableViewCell.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet weak var secondaryTextLabel : UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    
}
