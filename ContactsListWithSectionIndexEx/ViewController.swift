//
//  ViewController.swift
//  ContactsListWithSectionIndexEx
//
//  Created by Rajesh Kommana on 23/10/17.
//  Copyright © 2017 Rajesh Kommana. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var contactsList = ["Anji","Arjun","Bheema","Bhishma","Chiru","Chinna","David","Daveed","Giri","Hemu","Hari","Indra","Jay","Krishna","Laxman","Lucky","Mohan","Madhav","Naveen","Naresh","Naidu","Narayana","Pavan","Prakash","Rajesh","Raju","Satish","Satya","Trivikram","Tarun","Uday","Vinod","Vishal"]
    var contactIndexTitles = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var contactsSectionTitles = [String]()
    var contactsDict = [String: [String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createContactsDict()
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundView?.backgroundColor = UIColor(red: 236.0/255.0,
                                                             green: 240.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        headerView.textLabel?.textColor = UIColor(red: 231.0/255.0, green:
            76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        headerView.textLabel?.font = UIFont(name: "Avenir", size: 25.0)
    }
        
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactIndexTitles
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let sectionIndex = contactsSectionTitles.index(of: title) else {
            return -1
        }
        return sectionIndex
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactsSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return contactsSectionTitles[section]
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contactKey = contactsSectionTitles[section]
        guard let contactValues = contactsDict[contactKey] else {
            return 0
        }
        
        return contactValues.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contactKey = contactsSectionTitles[indexPath.section]
        guard let contactValues = contactsDict[contactKey] else {
            return UITableViewCell()
        }
        cell.textLabel?.text = contactValues[indexPath.row]
        
        return cell
    }
    func createContactsDict(){
        
        for contact in contactsList{
            let contactKey = String(contact[0])
            if var contactValues = contactsDict[contactKey]{
                contactValues.append(contact)
                contactsDict[contactKey] = contactValues
            } else {
                contactsDict[contactKey] = [contact]
            }
            
        }
        contactsSectionTitles = [String](contactsDict.keys)
        contactsSectionTitles = contactsSectionTitles.sorted(by:{
            return $0 < $1
        })
        print(contactsSectionTitles)
        print(contactsDict)
    }
}
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

