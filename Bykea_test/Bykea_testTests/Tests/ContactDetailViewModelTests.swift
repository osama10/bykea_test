//
//  ContactDetailViewModelTests.swift
//  Bykea_testTests
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
import CoreLocation

@testable import Bykea_test
class ContactDetailViewModelTests: XCTestCase {
    
   var viewModel : ContactDetailViewModelImp!
    override func setUp() {
        super.setUp()
        let contact = ContactModel(id: "1",
                                   name: "Osama",
                                   userName: "Osama",
                                   email: "o@b.com",
                                   phoneNumber: "+92-331-2651556",
                                   address: "Karachi",
                                   website: "www.osama.com",
                                   company: "abc",
                                   location: CLLocationCoordinate2D(latitude: 2.0, longitude: 2.0)
        )
        
        self.viewModel = ContactDetailViewModelImp(contact : contact)
       
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInfoTableViewCellViewModel(){
       let viewModel = self.viewModel.getInfoTableViewCellViewModel(of: 0)
        assert(viewModel.data.primaryText == "Name : Osama", "InfoTableViewCellViewMode failed")
    }
    
    func testGetMapViewModel(){
        let viewModel = self.viewModel.getMapViewModel()
        assert(viewModel.data.locationDescription == "Karachi", "GetMapViewModel failed")
    }
}
