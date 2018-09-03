//
//  Url.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct Url  {
    private let baseUrl : String
    private let api : String
    
    init(baseUrl : String , api : String = "") {
        self.baseUrl = baseUrl
        self.api = api
    }
    
    func getUrl()->String{
        return baseUrl + api
    }
}
