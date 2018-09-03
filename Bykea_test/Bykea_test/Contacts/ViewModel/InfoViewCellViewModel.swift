//
//  InfoViewCellViewModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol InfoTableViewCellViewModel {
    var data : InfoCellModel {get set}
}

struct InfoTableViewCellViewModelImp : InfoTableViewCellViewModel {
    var data : InfoCellModel
   
    init(data : InfoCellModel) {
        self.data = data
    }
}
