//
//  ContactListTableViewCell.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ContactListTableViewCell: UITableViewCell , ReusableView, NibLoadableView {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
