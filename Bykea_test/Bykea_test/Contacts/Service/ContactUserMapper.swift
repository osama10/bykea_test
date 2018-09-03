//
//  ContactUserMapper.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import CoreLocation

struct ContactUserMapper {
    static func toContactArray(from users : [User]?)->[ContactModel]{
        var contactsArray = [ContactModel]()
        
        if let userArray = users{
            userArray.forEach { (_user) in
                let address = "\((_user.address?.street!)!), \((_user.address?.city!)!)"
                
                let location = CLLocationCoordinate2D(latitude: (_user.address?.geo?.lat!.toDouble)!, longitude: (_user.address?.geo?.lng!.toDouble)!)
               
                let contact = ContactModel(id: String(_user.id!),  name: _user.name!, userName: _user.username!, email: _user.email!, phoneNumber: _user.phone!, address: address, website: _user.website!, company: (_user.company?.name!)!, location : location )
                contactsArray.append(contact)
            }
        }
        return contactsArray
    }
}
