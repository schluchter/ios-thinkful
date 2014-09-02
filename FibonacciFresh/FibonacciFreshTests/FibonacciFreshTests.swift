//
//  FibonacciFreshTests.swift
//  FibonacciFreshTests
//
//  Created by Thomas Schluchter on 8/31/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import UIKit
import XCTest
import FibonacciFresh

class FibonacciFreshTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let model = FibonacciModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFibonacciSequence () {
        let model = FibonacciModel()
        let expected: [Int] = [1,1,2,3,5]
        let input = 5
        
        let result = model.calculateFibonacciNumbers(minimum2: input)
    
        XCTAssertTrue(expected == result)
        
    }
    
    func testFibonacciMedium() {
        let model = FibonacciModel()
        let expected = [1,1,2,3,5,8,13,21,34,55]
        let input = 10
        
        let result = model.calculateFibonacciNumbers(minimum2: 10)
        
        XCTAssertTrue(expected == result)
    }
    
    func testFibonacciLargeInput() {
        let input = 45
        let model = FibonacciModel()
        let expectedCount = input
        let expectedLastValue = 1134903170
        
        let result = model.calculateFibonacciNumbers(minimum2: input)
        
        
        XCTAssertEqual(result.last!, expectedLastValue)
        XCTAssertEqual(result.count, expectedCount)
        
    }
    
    func testMeasureFibonacci() {
        let input = 45
        let model = FibonacciModel()
        let expectedCount = input
        let expectedLastValue = 1134903170
        
        var result = [Int]()
        self.measureBlock() {
            for _ in 1...400 {
                result = model.calculateFibonacciNumbers(minimum2: input)
                
            }
            XCTAssertEqual(countElements(result), input)
            XCTAssertEqual(result.last!, expectedLastValue)
        }
    }
}
