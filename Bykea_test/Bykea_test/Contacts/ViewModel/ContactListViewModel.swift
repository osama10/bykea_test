//
//  ContactListViewModel.swift
//  Bykea_test
//
//  Created by Osama Bin Bashir on 02/09/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol ContactListViewModel {
    
    var contactService : ContactServices{get}
    var contactList : [ContactModel]{get}
    var contactCount : Int {get}
    
    //func getContact(having id : Int)->ContactModel?
    func getAllContacts()
    func didTapOnRow(at index : Int)
    func getInfoTableViewCellViewModel(of index : Int)->InfoTableViewCellViewModel
    
    var isLoading : ((Bool)->())?{get set}
    var reloadData : (()->())?{get set}
    var showDetailView : ((ContactDetailViewModel) -> ())?{get set}
    var showAlert : ((String, String) -> ())?{get set}
}

class ContactListViewModelImp : ContactListViewModel{
   
    var contactList: [ContactModel]
    var contactService: ContactServices
   
    var isLoading: ((Bool) -> ())?
    var reloadData: (() -> ())?
    var showDetailView: ((ContactDetailViewModel) -> ())?
    var showAlert: ((String, String) -> ())?
    
    init(contactService : ContactServices) {
        contactList = []
        self.contactService = contactService
    }
    
    var contactCount: Int{
        return contactList.count
    }
    
     func getAllContacts() {
        if(Utils.isConnectedToInternet()){
            self.isLoading?(true)
            self.getDataFromService()
        }else{
            self.showAlert?("Error", "Please connect your device to internet")
        }
       
    }

    private func getDataFromService(){
        contactService.getAllContacts { [weak self](contacts, error) in
            guard let `self` = self else { return }
            self.contactList = contacts
            self.reloadData?()
            self.isLoading?(false)
            if error != nil {
                self.showAlert?("Error", "Something bad happend . Please try later")
            }
        }
    }
    func didTapOnRow(at index: Int) {
        self.showDetailView?(getDetailViewModel(at: index))
    }
    func getDetailViewModel(at index : Int)->ContactDetailViewModel{
        let contact = contactList[index]
        let contactViewModel = ContactDetailViewModelImp(contact: contact)
        return contactViewModel
    }
    func getInfoTableViewCellViewModel(of index : Int) -> InfoTableViewCellViewModel {
        let contact = self.contactList[index]
        let data = InfoCellModel(primaryText: contact.name, secondaryText: contact.email)
        let infoViewModel = InfoTableViewCellViewModelImp(data: data)
        return infoViewModel
    }
}
