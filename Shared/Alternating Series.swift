//
//  Alternating Series.swift
//  HW2-AlternatingSeries
//
//  Created by Shayarneel Kundu on 2/3/22.
//

import Foundation
import SwiftUI

// Define that aliases that will make things easier with series later on
typealias nthTermParameterTuple = (n: Int, x: Double)
typealias nthTermMultiplierHandler = (_ parameters: Int) -> Double

class AlternatingSeries: ObservableObject{
    
    ///This this computes a finite sum in one variable, provided that in the series, we can express each term in the series
    ///recursively
    
    func Calculate1DFiniteSum(function: nthTermMultiplierHandler, minimum: Int, maximum: Int) -> Double {
        
        var sum = 0.0
        
        for n in minimum...maximum {
         
            sum += function(n)
            
        }
       
        return sum
    
    }
    
   ///For this problem, we comptue the same finite sum in three different ways.

  // The first summation uses
  //  __ 2N        n   n
  //  \       (- 1)  ------ = S
  //  /__ n=1         n+1      1



    func Sum1(n: Int) -> Double{
    
        let numerator = pow(-1.0, Double(n)) * Double(n)
        let denominator = Double(n) + 1.0
        let termOne = numerator/denominator
        
        return termOne
    }
    
    
    // The second summation cancellation between a an even and an odd finite series
    //  __ N      2n      __ N     2n-1
    //  \       ------ -  \       ------ = S
    //  /__ n=1  2n+1     /__ n=1   2n      2
    
    
    func Sum2(n: Int) -> Double{
    
        let numeratorEven = 2.0 * Double(n)
        let denominatorEven = 2.0 * Double(n) + 1.0
        let termEven = numeratorEven/denominatorEven
        
        let numeratorOdd = 2.0 * Double(n) - 1.0
        let denominatorOdd = 2.0 * Double(n)
        let termOdd = numeratorOdd/denominatorOdd
        
        let termTwo = -termOdd + termEven
        
        
        return termTwo
    }
    
    // The third summation is again just a single term that is summed over
    //  __ N          1
    //  \        ---------- = S
    //  /__ n=1   2n(2n+1)     3
    
    
    func Sum3(n: Int) -> Double{
    
        let denominatorEven = (2.0 * Double(n)) * (2.0 * Double(n) + 1.0)
        let termThree = 1.0/denominatorEven
          
        
        return termThree
    }
    
    // Now, we need to compute the errors. This is just the typical error calcualtor
    
    func ErrorCalculator(Val1: Double, Val2: Double) -> Double{
        
        let error = abs(Val1 - Val2)/(abs(Val1) + abs(Val2))
        
        return error
    }
    
    
    
}
