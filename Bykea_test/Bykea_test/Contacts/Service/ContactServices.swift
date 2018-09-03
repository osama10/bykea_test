//
//  File.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol ContactServices  {
    func getAllContacts( result : @escaping([ContactModel], Error?)-> Void)
}

struct ContactServicesImp : ContactServices {
    
    let webManager : WebManager
    
    init(webManager : WebManager) {
        self.webManager = webManager
    }
    
    func getAllContacts( result : @escaping([ContactModel], Error?)-> Void){
        webManager.makeRequest(request: Request.getusersRequest(), success: { (response) in
            let users = User.toUserArray(from: response as! [[String : AnyObject]]) ?? []
            let contacts  = ContactUserMapper.toContactArray(from:users )
            result(contacts,nil)
        }) { (error) in
            result([], error)
        }
       
    }
    
   
}
