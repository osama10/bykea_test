//
//  AddressModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
import Foundation
import  ObjectMapper



struct Address : Mappable {
    
    enum AddressKeys : String{
        case city
        case geo
        case street
        case suite
        case zipcode
    }
    
    var city : String?
    var geo : Geo?
    var street : String?
    var suite : String?
    var zipcode : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        city <- map[AddressKeys.city.rawValue]
        geo <- map[AddressKeys.geo.rawValue]
        street <- map[AddressKeys.street.rawValue]
        suite <- map[AddressKeys.suite.rawValue]
        zipcode <- map[AddressKeys.zipcode.rawValue]
        
    }
}
