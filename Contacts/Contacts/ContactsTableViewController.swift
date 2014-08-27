//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, dataUpdated {
    
    @IBAction func addContact(sender: AnyObject) {
        self.performSegueWithIdentifier("createNewContact", sender: self)
    }
    
    struct ContactInfo {
        var name: String
        var phoneNumber: String
    }
    
    var listOfContacts: [ContactInfo] = [
        ContactInfo(name: "Jemma Wiley", phoneNumber: "513-123-4567"),
        ContactInfo(name: "Rachel Holman", phoneNumber: "123-456-7890")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            listOfContacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
        let fromContact = listOfContacts[sourceIndexPath.row]
        listOfContacts.removeAtIndex(sourceIndexPath.row)
        listOfContacts.insert(fromContact, atIndex: destinationIndexPath.row)
    }
    
    func didUpdateContact(sender: AnyObject, aName: String, aPhoneNumber: String) {
        var newContact = ContactInfo(name: aName, phoneNumber: aPhoneNumber)
        listOfContacts.append(newContact)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.listOfContacts.count
    }


    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath) as UITableViewCell
        
        let name: String = listOfContacts[indexPath.row].name
        let phoneNumber: String = listOfContacts[indexPath.row].phoneNumber
        
        cell.textLabel.text = name
        cell.detailTextLabel.text = phoneNumber
        return cell
    }

    // MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "toDetail" {
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            let selectedRow = listOfContacts[indexPath.row]
            let destination = (segue.destinationViewController as ContactDetailViewController)
            
            destination.contactName = selectedRow.name
            destination.contactPhoneNumber = selectedRow.phoneNumber
            
        } else if segue.identifier == "createNewContact" {
            ((segue.destinationViewController as UINavigationController).viewControllers[0] as CreateContactViewController).delegate = self
        }
    }
}
