//
//  ViewController.swift
//  FibonacciFresh
//
//  Created by Thomas Schluchter on 8/31/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var rangeSlider: UISlider!
    @IBOutlet var selectedRange: UILabel!
    @IBOutlet var results: UILabel!
    
    let model = FibonacciModel()
    var currentRange = 0
    
    // MARK: IBActions
    
    @IBAction func didSelectNewRange(sender: AnyObject) {
        println(__FUNCTION__)
        currentRange = Int(self.rangeSlider.value)
        let numbers = self.model.calculateFibonacciNumbers(minimum2: currentRange)

        
        self.selectedRange.text = String(Int(self.rangeSlider.value))
        
        self.results.text = "Fibonacci numbers from 1 to \(self.selectedRange.text): \(numbers)"
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rangeSlider.minimumValue = 2.0
        self.rangeSlider.maximumValue = 50.0
        self.selectedRange.text = String(Int(self.rangeSlider.value))
        self.maxLabel.text = String(Int(self.rangeSlider.maximumValue))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

