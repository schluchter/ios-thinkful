//
//  ViewController.swift
//  Fibonacci
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Lifecycle methods
        override func viewDidLoad() {
        super.viewDidLoad()
        selectedValueLabel.text = String(Int(self.slider.value))
    }
    
    //MARK: Custom stuff
    let fibo = FibonacciModel()
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var selectedValueLabel: UILabel!
    @IBOutlet var outputTextView: UITextView!
    
    @IBAction func sliderDidChange(sender: AnyObject) {
        var resultArray : [Int] = []
        var formattedOutputString = ""
        
        self.selectedValueLabel!.text = String(Int(slider.value))
        
        resultArray = self.fibo.calculateFibonacciNumbers(upTo: Int(slider.value))
        formattedOutputString = "The Fibonacci sequence for \(Int(slider.value)) is \(resultArray)"
        
        self.outputTextView.text = formattedOutputString
    }
}
