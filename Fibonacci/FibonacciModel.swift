//
//  FibonacciModel.swift
//  Fibonacci
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import Foundation

public class FibonacciModel {
    
    public init() {}
    
    var sequence : [Int] = [1,1]

    public func calculateFibonacciNumbers(upTo endOfSequence : Int) -> Array<Int> {

        for number in 2..<endOfSequence {
            var newNum : Int = sequence[number-1] + sequence[number-2]
            sequence.append(newNum)
        }
        return sequence
    }
}