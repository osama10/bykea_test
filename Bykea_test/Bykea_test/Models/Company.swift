//
//  Company.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

//struct Company : Codable {
//
//    let bs : String?
//    let catchPhrase : String?
//    let name : String?
//
//
//    enum CodingKeys: String, CodingKey {
//        case bs = "bs"
//        case catchPhrase = "catchPhrase"
//        case name = "name"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        bs = try values.decodeIfPresent(String.self, forKey: .bs)
//        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
//
//
//}

struct Company : Mappable {
   
    enum CompanyKeys: String{
        case bs
        case catchPhrase
        case name
    }
    var bs : String?
    var catchPhrase : String?
    var name : String?
    
    init?(map: Map) {
        
    }
  
    mutating func mapping(map: Map) {
        bs <- map[CompanyKeys.bs.rawValue]
        catchPhrase <- map[CompanyKeys.catchPhrase.rawValue]
        name <- map[CompanyKeys.name.rawValue]
    }
}
