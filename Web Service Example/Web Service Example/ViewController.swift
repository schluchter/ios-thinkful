//
//  ViewController.swift
//  Web Service Example
//
//  Created by Thomas Schluchter on 9/1/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myNameLabel: LTMorphingLabel!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myNameLabel.morphingEffect = .Evaporate
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET("http://graph.facebook.com/schluchter",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                if let myName = responseObject.valueForKey("name") as? String {
                    self.myNameLabel.text = ""
                    self.loadingSpinner.removeFromSuperview()
                    self.myNameLabel.text = myName
                }
            },
            failure:  { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

