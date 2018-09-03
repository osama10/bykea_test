//
//  AddressModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//
import Foundation
import  ObjectMapper

//struct Address : Codable {
//
//    let city : String?
//    let geo : Geo?
//    let street : String?
//    let suite : String?
//    let zipcode : String?
//
//
//    enum CodingKeys: String, CodingKey {
//        case city = "city"
//        case geo
//        case street = "street"
//        case suite = "suite"
//        case zipcode = "zipcode"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        city = try values.decodeIfPresent(String.self, forKey: .city)
//        geo = try Geo(from: decoder)
//        street = try values.decodeIfPresent(String.self, forKey: .street)
//        suite = try values.decodeIfPresent(String.self, forKey: .suite)
//        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
//    }
//
//
//}

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
