//
//  MockContactService.swift
//  Bykea_testTests
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Bykea_test
import CoreLocation

struct MockContactService : ContactServices{
    
    func getAllContacts(result: @escaping ([ContactModel], Error?) -> Void) {
        let contact = ContactModel(id: "1", name: "Osama", userName: "Osama", email: "o@b.com", phoneNumber: "+92-331-2651556", address: "Karchi", website: "www.osama.com", company: "abc", location: CLLocationCoordinate2D(latitude: 2.0, longitude: 2.0))
      
        let mockData = [contact, contact, contact]
     
        result(mockData, nil)
    }
    
    
}
