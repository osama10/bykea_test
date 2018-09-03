//
//  GoogleMapViewModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol GoogleMapViewModel {
    var data : MapModel{get set}
    var showLocation : ((Double)->())?{get set}
    
    func setLocationOnMap()
}


class GoogleMapViewModelImp: GoogleMapViewModel {
    var data: MapModel
    var showLocation: ((Double) -> ())?
    
    init(data : MapModel) {
        self.data = data
    }
    
    func setLocationOnMap() {
        self.showLocation?(12.0)
    }
}
