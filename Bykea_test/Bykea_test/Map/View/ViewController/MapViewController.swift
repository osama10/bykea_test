//
//  GoogleMapViewController.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class MapViewController: UIViewController , Injectable{
    
    var mapView : GoogleMapView!
    var viewModel : MapViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = GoogleMapView.loadNib()
        mapView.inject(viewModel.getGoogleMapViewModel())
        mapView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(mapView)
        
        self.mapView.viewModel.setLocationOnMap()
        self.title = "MapView"
    }
    
    func inject(_ viewModel : MapViewModel) {
        self.viewModel = viewModel
    }
    

}

extension MapViewController: StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
