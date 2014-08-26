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
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!

    @IBAction func saveContact(sender: AnyObject) {
        if (newName != "" && newPhoneNumber != "") {
            self.delegate!.didUpdateContact(self, aName: newName, aPhoneNumber: newPhoneNumber)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelCreate(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    var newName = ""
    var newPhoneNumber = ""
    var delegate: dataUpdated?

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
    
    // MARK: - UITextFieldDelegate methods
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        self.textFieldShouldReturn(textField)
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        switch textField.tag {
        case 1:
            newName = textField.text
        case 2:
            newPhoneNumber = textField.text
        default:
            println("Unknown textfield returning")
        }
        
        textField.resignFirstResponder()
        
        return true
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
