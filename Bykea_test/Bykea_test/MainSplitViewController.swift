//
//  MainSplitViewController.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class MainSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }

}

extension MainSplitViewController : UISplitViewControllerDelegate{
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
