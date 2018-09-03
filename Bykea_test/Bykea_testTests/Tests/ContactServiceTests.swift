//
//  ContactServiceTests.swift
//  Bykea_testTests
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Bykea_test
class ContactServiceTests: XCTestCase {
    
    let contactService = ContactServicesImp(webManager: MockWebManager())
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    func testGetAllData(){
        contactService.getAllContacts { (contactList, error) in
            assert(contactList.count == 10, "Get all data Test failed")
            assert(contactList[0].name == "Leanne Graham", "Get all data Test failed")
        }
    }
  
    
}
