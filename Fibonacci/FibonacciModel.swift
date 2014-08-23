//
//  FibonacciModel.swift
//  Fibonacci
//
//  Created by Thomas Schluchter on 8/23/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import Foundation

class FibonacciModel {

    func calculateFibonacciNumbers(upTo endOfSequence : Int) -> Array<Int> {
        var sequence : [Int] = [1,1]
        for number in 2..<endOfSequence {
            var newNum : Int = sequence[number-1] + sequence[number-2]
            sequence.append(newNum)
        }
        return sequence
    }
}