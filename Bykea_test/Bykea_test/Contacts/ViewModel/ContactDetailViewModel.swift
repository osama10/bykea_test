//
//  ContactDetailViewModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreLocation

protocol ContactDetailViewModel {
    var contact : ContactModel {get}
    var rowCount : Int {get set}
    var rowHeight : Int{get set}
    var showMapView : ((MapViewModel)->())? {get set}
    
    func getInfoTableViewCellViewModel(of index : Int)->InfoTableViewCellViewModel
    
    func didTapOnShowLocationButton()
}

class ContactDetailViewModelImp : ContactDetailViewModel{
    
    enum InfoCellType : Int{
        case name = 0
        case userName = 1
        case email = 2
        case phone = 3
        case address = 4
        case website = 5
        case companyDetails = 6
    }
    
    var contact: ContactModel
    
    var rowCount = 7
    var rowHeight: Int = 70
    var showMapView: ((MapViewModel) -> ())?
    
    init(contact : ContactModel) {
        self.contact = contact
    }
    
    func getInfoTableViewCellViewModel(of index: Int) -> InfoTableViewCellViewModel {
        let data = getInfoCellData(cellType: InfoCellType(rawValue: index)!)
        let infoViewModel = InfoTableViewCellViewModelImp(data: data)
        return infoViewModel
    }
    
    func getMapViewModel()->MapViewModel{
       
        let data = MapModel(locationTitle: self.contact.name, locationDescription:self.contact.address, locationMarker:"marker" , coordiante: self.contact.location)
        let viewModel = MapViewModelImp(data : data)
        
        return viewModel
    }
  
    private func getInfoCellData(cellType : InfoCellType)->InfoCellModel{
        var data : InfoCellModel!
        switch cellType {
        case .name:
            data = InfoCellModel(primaryText: "Name : " + contact.name, secondaryText: "")
        case .userName:
            data = InfoCellModel(primaryText: "UserName : " + contact.userName, secondaryText: "")
        case .email:
            data = InfoCellModel(primaryText: "Email : " + contact.email, secondaryText: "")
        case .phone:
            data = InfoCellModel(primaryText: "PhoneNo. : " + contact.phoneNumber, secondaryText: "")
        case .address:
            data = InfoCellModel(primaryText: "Address : " + contact.address, secondaryText: "")
        case .website:
            data = InfoCellModel(primaryText: "Website : " + contact.website, secondaryText: "")
        case .companyDetails:
            data = InfoCellModel(primaryText: "Company : " + contact.company, secondaryText: "")
        
        }
        return data
    }
    
    func didTapOnShowLocationButton() {
        self.showMapView?(self.getMapViewModel())
    }
    
    
    
}
