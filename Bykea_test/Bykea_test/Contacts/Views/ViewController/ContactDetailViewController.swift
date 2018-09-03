//
//  ContactListViewController.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ContactDetailViewController : UIViewController, Injectable {
    
    
    @IBOutlet weak var tableView : UITableView!
    var viewModel : ContactDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(InfoTableViewCell.self)
        self.tableView.setdelegateAndDatasource(for: self)
        self.bindUI()
        self.title = self.viewModel?.contact.name
    }
    
    private func bindUI(){
        self.viewModel?.showMapView = { [weak self] (viewModel) in
            guard let `self` = self else { return }
            let mapVC = MapViewController.instantiateViewController()
            mapVC.inject(viewModel)
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    @IBAction func didTapOnShowLocation(sneder : UIButton){
        viewModel?.didTapOnShowLocationButton()
    }
    
    func inject(_ viewModel : ContactDetailViewModel) {
        self.viewModel = viewModel
    }
    
    

}

extension ContactDetailViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeResuseableCell(for: indexPath) as InfoTableViewCell
        cell.configureCell(with: (viewModel?.getInfoTableViewCellViewModel(of: indexPath.row))!)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel?.rowHeight ?? 0)
    }
}

extension ContactDetailViewController: StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
