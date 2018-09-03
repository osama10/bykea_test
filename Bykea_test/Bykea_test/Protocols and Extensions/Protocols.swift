//
//  Protocols.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController,
    SegueIdentifier.RawValue == String
{
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier,
                                    sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {fatalError("Invalid segue identifier \(String(describing: segue.identifier)).") }
        
        return segueIdentifier
        
    }
}



protocol Injectable {
    associatedtype T
    func inject(_: T)
   // func assertDependencies()
}

protocol ReusableView : class {  static var reuseIdentifier : String {get} }



protocol NibLoadableView : class { static var nibName : String {get} }


protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> Self
}

protocol AlertsPresentable : class {}

