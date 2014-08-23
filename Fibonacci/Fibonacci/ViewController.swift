//
//  ViewController.swift
//  Fibonacci
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Why is it necessary to declare variables holding UIView instances as optional? Is there any risk they could be nil?
    var selectedValueLabel: UILabel?
    var outputTextView: UITextView?
    var theSlider : UISlider?
    
    let fibo = FibonacciModel()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addASlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addASlider() {
        self.theSlider = UISlider(frame: CGRectMake(60, 244, 200, 20))
        self.view.addSubview(self.theSlider!)
        
        self.theSlider!.minimumValue = 2
        self.theSlider!.maximumValue = 50
        
        let minLabel = UILabel(frame: CGRectMake(70, 205, 40, 40))
        minLabel.text = String(Int(self.theSlider!.minimumValue))
        self.view.addSubview(minLabel)
        
        let maxLabel = UILabel(frame: CGRectMake(235, 205, 40, 40))
        maxLabel.text = String(Int(self.theSlider!.maximumValue))
        self.view.addSubview(maxLabel)
        
        self.selectedValueLabel = UILabel(frame: CGRectMake(140, 320, 40, 40))
        self.selectedValueLabel!.text = String(Int(self.theSlider!.value))
        self.view.addSubview(selectedValueLabel!)
        
        self.outputTextView = UITextView(frame: CGRectMake(20, 350, 300, 140))
        self.view.addSubview(self.outputTextView!)
        
        self.theSlider!.addTarget(self, action: "sliderValueDidChange", forControlEvents: UIControlEvents.ValueChanged)

    }
    
    func sliderValueDidChange() {
        var resultArray : [Int] = []
        var formattedOutputString = ""
        
        self.selectedValueLabel!.text = String(Int(theSlider!.value))
        
        resultArray = self.fibo.calculateFibonacciNumbers(upTo: Int(self.theSlider!.value))
        formattedOutputString = "The Fibonacci sequence for \(Int(self.theSlider!.value)) is \(resultArray)"
        
        self.outputTextView?.text = formattedOutputString
    }


}

