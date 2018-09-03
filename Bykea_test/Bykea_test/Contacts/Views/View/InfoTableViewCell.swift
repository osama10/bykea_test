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
   
    var viewModel : InfoTableViewCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    // for initial cell configuiration
    func configureCell(with viewModel : InfoTableViewCellViewModel){
        self.viewModel = viewModel
        self.setData()
    }
   
    //for setting cell witht the data
    private func setData(){
        self.primaryTextLabel.text = self.viewModel.data.primaryText
        self.secondaryTextLabel.text = self.viewModel.data.secondaryText
    }
    
}
