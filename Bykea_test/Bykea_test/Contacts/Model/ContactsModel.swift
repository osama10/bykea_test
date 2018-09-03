//
//  ContactsModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreLocation

struct ContactModel{
    let id : String
    let name : String
    let userName : String
    let email : String
    let phoneNumber : String
    let address : String
    let website : String
    let company : String
    let location : CLLocationCoordinate2D
    init(id : String, name : String, userName : String, email : String , phoneNumber : String, address : String, website : String, company : String, location : CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.userName = userName
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
        self.website = website
        self.company = company
        self.location = location
    }
}


