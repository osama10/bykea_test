//
//  UserModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper


struct User : Mappable {
    
    enum UserKeys: String{
        case address
        case company
        case email
        case id
        case name
        case phone
        case username
        case website
    }
  
    var address : Address?
    var company : Company?
    var email : String?
    var id : Int?
    var name : String?
    var phone : String?
    var username : String?
    var website : String?
    
    init?(map: Map) {
        
    }
   
    mutating func mapping(map: Map) {
        address <- map[UserKeys.address.rawValue]
        company <- map[UserKeys.company.rawValue]
        email <- map[UserKeys.email.rawValue]
        id <- map[UserKeys.id.rawValue]
        name <- map[UserKeys.name.rawValue]
        phone <- map[UserKeys.phone.rawValue]
        username <- map[UserKeys.username.rawValue]
        website <- map[UserKeys.website.rawValue]
    }
    
    static func toUserArray(from userJson : [[String : AnyObject]])->[User]?{
            let  users = Mapper<User>().mapArray(JSONArray: userJson)
            return users
    }
}

