//
//  ContactListTableViewController.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(InfoTableViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ContactListTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // will be return by vm
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeResuseableCell(for: indexPath) as InfoTableViewCell
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ContactDetailViewController.instantiateViewController()
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ContactListTableViewController: StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
