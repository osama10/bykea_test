//
//  ContactListViewModelTests.swift
//  Bykea_testTests
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Bykea_test
class ContactListViewModelTests: XCTestCase {
    
    let viewModel  = ContactListViewModelImp(contactService: MockContactService())
   
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetAllContacts(){
        self.viewModel.getAllContacts()
        assert(self.viewModel.contactList.count == 3, "Get all contacts failed")
    }
    
    func testGetInfoTableViewCellViewModel(){
        self.viewModel.getAllContacts()
        let viewModel = self.viewModel.getInfoTableViewCellViewModel(of: 1)
        assert(viewModel.data.primaryText == "Osama", "InfoTableViewCellViewModel tests failed")
        assert(viewModel.data.secondaryText == "o@b.com", "InfoTableViewCellViewModel tests failed")
    }
    
    func testGetDetailViewModel(){
        self.viewModel.getAllContacts()
        let viewModel = self.viewModel.getDetailViewModel(at: 1)
        assert(viewModel.contact.name == "Osama", "GetDetailViewModel tests failed")
        assert(viewModel.contact.email == "o@b.com", "GetDetailViewModel tests failed")
    }
}
