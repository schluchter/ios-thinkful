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
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myNameLabel.morphingEffect = .Evaporate
        self.profilePicture.alpha = 0.0
        
        self.loadingSpinner.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let myprofilePictureURL = NSURL(string: "http://graph.facebook.com/schluchter/picture?type=square&width=120&height=120")
            let imageData = NSData(contentsOfURL: myprofilePictureURL)
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.profilePicture.image = UIImage(data: imageData)
                self.loadingSpinner.stopAnimating()
                
                UIView.animateWithDuration(1.0,
                    animations: {
                    self.profilePicture.alpha = 1.0
                    },
                    completion: {
                        (value: Bool) in
                        println("Animation complete!")
                    }
                )
            })
        }
        
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://graph.facebook.com/schluchter",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                if let myName = responseObject.valueForKey("name") as? String {
                    self.myNameLabel.text = ""
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

