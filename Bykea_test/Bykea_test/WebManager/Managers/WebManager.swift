//
//  WebManager.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol WebManager {
    func makeRequest(request : Request,  success:@escaping (Any) -> Void, failure:@escaping (Error) -> Void)
}
