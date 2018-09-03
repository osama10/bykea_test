//
//  MapViewModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol MapViewModel {
    var data : MapModel{get}
    
    func getGoogleMapViewModel()->GoogleMapViewModel
}


class MapViewModelImp : MapViewModel{
    var data: MapModel
    
    init(data : MapModel) {
        self.data = data
    }
    
    func getGoogleMapViewModel() -> GoogleMapViewModel {
        let viewModel = GoogleMapViewModelImp(data: self.data)
        return viewModel
    }
}
