//
//  GeoModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper
//struct Geo : Codable {
//
//    let lat : String?
//    let lng : String?
//
//
//    enum CodingKeys: String, CodingKey {
//        case lat = "lat"
//        case lng = "lng"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        lat = try values.decodeIfPresent(String.self, forKey: .lat)
//        lng = try values.decodeIfPresent(String.self, forKey: .lng)
//    }
//
//
//}

struct Geo : Mappable {
    enum GeoKeys : String{
        case lat
        case lng
    }
    
    var lat : String?
    var lng : String?
   
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        lat <- map[GeoKeys.lat.rawValue]
        lng <- map[GeoKeys.lng.rawValue]
    }
    
   
}
