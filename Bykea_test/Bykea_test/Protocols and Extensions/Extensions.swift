//
//  Extensions.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//


import Foundation
import UIKit
import CoreLocation
//import Alamofire

extension Int{
    
    var toString: String{
        return String(self)
    }
}

extension Double{
    var toString: String{
        return String(self)
    }
}

extension String {
    var toDouble : Double{
        return Double(self) ?? 0.0
    }
}
extension UIStoryboard {
    enum Storyboard: String {
        case main
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
}

extension StoryboardInitializable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName: UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.main
    }
    static func instantiateViewController() -> Self {
        let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        
    }
}

extension NibLoadableView where Self : UIView {
    static var nibName : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    static func loadNib() -> Self {
        let bundle = Bundle(for:Self.self)
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}

extension UITableView {
    func register<T:UITableViewCell>(_ : T.Type) where T : ReusableView , T : NibLoadableView{
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeResuseableCell<T:UITableViewCell>(for indexPath : IndexPath)->T where T : ReusableView{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Couldn't cast cell in \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func setdelegateAndDatasource(for viewController : UIViewController){
        self.delegate = viewController as? UITableViewDelegate
        self.dataSource = viewController as? UITableViewDataSource
    }
    
    func setdelegateAndDatasource(for view : UIView){
        self.delegate = view as? UITableViewDelegate
        self.dataSource = view as? UITableViewDataSource
    }
    
}

extension AlertsPresentable where Self : UIViewController {
    
    func showAlert(with title: String? = nil , and message: String? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}

extension ReusableView where Self : UIView {
    static var reuseIdentifier : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
