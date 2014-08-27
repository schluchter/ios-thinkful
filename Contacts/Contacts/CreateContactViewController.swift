//
//  CreateContactViewController.swift
//  Contacts
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

protocol dataUpdated: NSObjectProtocol {
    func didUpdateContact(sender: AnyObject, aName: String, aPhoneNumber: String)
}

class CreateContactViewController: UIViewController, UITextFieldDelegate {
    
    var newName = ""
    var newPhoneNumber = ""
    var delegate: dataUpdated?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!

    @IBAction func saveContact(sender: AnyObject) {
        println(__FUNCTION__)
        
        self.newName = nameField.text
        self.newPhoneNumber = phoneNumberField.text

        if (newName != "" && newPhoneNumber != "") {
            self.delegate!.didUpdateContact(self, aName: newName, aPhoneNumber: newPhoneNumber)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelCreate(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    


}
