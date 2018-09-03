//
//  GoogleMapView.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapView: UIView , Injectable, NibLoadableView{

    @IBOutlet weak var mapView: GMSMapView!
    var viewModel : GoogleMapViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func inject(_ viewModel: GoogleMapViewModel) {
        self.viewModel = viewModel
        bindUI()
    }
   
    private func bindUI(){
        self.viewModel.showLocation = { [weak self] (zoom) in
            guard let `self` = self else { return }
            self.setCamera(location: self.viewModel.data.coordiante , zoom: Float(zoom))
            
            self.setMarker(position: self.viewModel.data.coordiante, title: self.viewModel.data.locationTitle , snippet: self.viewModel.data.locationDescription , image: self.viewModel.data.locationMarker)
        }
    }
 
    private func setMarker(position : CLLocationCoordinate2D , title : String , snippet : String , image : String ){
        let markerOrig = GMSMarker()
        markerOrig.position = position
        markerOrig.title = title
        markerOrig.snippet = snippet
        markerOrig.map = mapView
        markerOrig.icon = UIImage(named: image)
    }
    
    private func setCamera(location : CLLocationCoordinate2D , zoom : Float){
        let camera = GMSCameraPosition.camera(withLatitude: (location.latitude), longitude: (location.longitude), zoom: zoom)
        mapView.camera = camera
    }
}
