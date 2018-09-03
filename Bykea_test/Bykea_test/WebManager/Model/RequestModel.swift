//
//  RequestModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import Alamofire

struct Request {
    var url : Url
    var httpMethod : HTTPMethod 
    var params : [String : AnyObject]?
    var headers : [String : String]?
    
    init(url : Url, httpMethod : HTTPMethod = .get, params :[String : AnyObject]? = nil, headers : [String : String]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.params = params
        self.headers = headers
    }
}

extension Request {
    static func getusersRequest() -> Request{
        return Request(url: Url(baseUrl : Routes.baseUrl, api :  Routes.users))
    }
    
    static func getUserRequest(having id : String)->Request{
        return Request(url: Url(baseUrl : Routes.baseUrl, api :  Routes.users + "/\(id)"))
    }
}
