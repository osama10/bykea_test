//
//  ContactListTableViewController.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController,AlertsPresentable {
    
    var viewModel : ContactListViewModel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.tableView.register(InfoTableViewCell.self)
        viewModel = ContactListViewModelImp(contactService: ContactServicesImp(webManager: AlamofireManager()))
        self.bindUI()
        viewModel.getAllContacts()
    }
    
    private func bindUI(){
        viewModel.reloadData = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
        
        viewModel.isLoading = { [weak self] (isLoading) in
            guard let `self` = self else { return }
            (isLoading) ? self.view.makeToastActivity(.center) : self.view.hideToastActivity()
        }
        
        viewModel.showDetailView = { [weak self] (viewModel) in
            guard let `self` = self else { return }
            let detailVC = ContactDetailViewController.instantiateViewController()
            detailVC.inject(viewModel)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        viewModel.showAlert = { [weak self] (title, message) in
            guard let `self` = self else { return }
            self.showAlert(with: title, and: message)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ContactListTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeResuseableCell(for: indexPath) as InfoTableViewCell
        cell.configureCell(with: viewModel.getInfoTableViewCellViewModel(of: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       viewModel.didTapOnRow(at: indexPath.row)
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
