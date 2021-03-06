//
//  ViewController.swift
//  Profile Picture Example
//
//  Created by Thomas Schluchter on 9/6/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.retrieveInstagramImagesForTag("puppy")
    }
    
    private func retrieveInstagramImagesForTag(tag: String) {
        let manager = AFHTTPRequestOperationManager()
        manager.GET("https://api.instagram.com/v1/tags/\(tag.lowercaseString)/media/recent?client_id=32805f7b60c64cbeb1fd3ef674bde061",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) in
                if let dataArray = response.valueForKey("data") as? [AnyObject] {
                    
                    for (index, obj) in enumerate(dataArray) {
                        let dataObject: AnyObject = obj
                        
                        if let imageURLString = dataObject.valueForKeyPath("images.standard_resolution.url") as? String {
                            let imageView = UIImageView(frame: CGRectMake(0, CGFloat(320 * index), 320, 320))
                            let url = NSURL(string: imageURLString)
                            imageView.setImageWithURL(url)
                            
                            self.scrollView.addSubview(imageView)
                        }
                    }
                }
                self.scrollView.contentSize.height = self.scrollView.subviews.last!.frame.maxY
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("Error: \(error.localizedDescription)")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UISearchBarDelegate methods
    func searchBarTextDidBeginEditing(searchBar: UISearchBar!) {
        UIView.animateWithDuration(0.4, animations: {
            self.scrollView.alpha = 0.25
        })
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        for subview in self.scrollView.subviews {
            subview.removeFromSuperview()
            searchBar.resignFirstResponder()
        }
        self.scrollView.alpha = 1
        self.retrieveInstagramImagesForTag(searchBar.text)
    }
    
    //MARK: - UIScrollViewDelegate methods
    func scrollViewDidScroll(scrollview: UIScrollView!) {
        println("Huzzah!")
    }
}