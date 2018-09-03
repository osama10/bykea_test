//
//  UserModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

//struct User : Codable {
//
//    let address : Address?
//    let company : Company?
//    let email : String?
//    let id : Int?
//    let name : String?
//    let phone : String?
//    let username : String?
//    let website : String?
//
//
//    enum CodingKeys: String, CodingKey {
//        case address
//        case company
//        case email = "email"
//        case id = "id"
//        case name = "name"
//        case phone = "phone"
//        case username = "username"
//        case website = "website"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        address = try Address(from: decoder)
//        company = try Company(from: decoder)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        website = try values.decodeIfPresent(String.self, forKey: .website)
//    }
//
//    static func toUserArray(from user : Data)->[User]?{
//        var userToReturn : [User]?
//        let decoder = JSONDecoder()
//        do{
//
//            userToReturn = try decoder.decode([User].self, from: user)
//        }
//        catch{
//            userToReturn = nil
//        }
//        return userToReturn
//    }
//}

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
