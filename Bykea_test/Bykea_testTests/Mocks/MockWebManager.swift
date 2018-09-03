//
//  MockWebManager.swift
//  Bykea_testTests
//
//  Created by Osama Bin Bashir on 03/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Bykea_test

class MockWebManager : WebManager{
    func makeRequest(request: Request, success: @escaping (Any) -> Void, failure: @escaping (Error) -> Void) {
        guard let pathString = Bundle(for: type(of: self) ).path(forResource: "MockData", ofType: "json") else {
            fatalError("MockData.json not found")
        }
        
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to NSData")
        }
        
        guard let jsonResponse = try? JSONSerialization.jsonObject(with: jsonData, options: [])  else {
            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
        }
        
        print("The JSON dictionary is: \(jsonResponse)")
        success(jsonResponse)
    }
    
    
}
