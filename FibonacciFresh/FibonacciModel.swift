//
//  FibonacciModel.swift
//  FibonacciFresh
//
//  Created by Thomas Schluchter on 8/31/14.
//  Copyright (c) 2014 Thomas Schluchter. All rights reserved.
//

import Foundation

public class FibonacciModel {
    public init() {}
    
    private struct FibGenerator : GeneratorType {
        typealias Element = Int
        var left = 0, right = 0
        
        mutating func next() -> Int? {
            if(left == 0) {left = 1; return 1}
            if(right == 0) {right = 1; return 1}
            var sum = left+right; left=right; right=sum
            return sum
        }
    }
    
    public func calculateFibonacciNumbers(minimum2 endOfSequence: Int) -> [Int] {
        var fib = FibGenerator()
        let order = (endOfSequence < 2 || endOfSequence > 45) ? 0 : endOfSequence
        
        return (0..<order).map { elephant in fib.next()! }
    }
}