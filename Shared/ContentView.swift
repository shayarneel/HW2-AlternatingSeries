//
//  ContentView.swift
//  Shared
//
//  Created by Shayarneel Kundu on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var alternatingSeries = AlternatingSeries()
    
    @State var nval = "1"
    @State var sum1String = ""
    @State var sum2String = ""
    @State var sum3String = ""
    @State var sum1ErrorString = ""
    @State var sum2ErrorString = ""
    @State var sum3ErrorString = "Asssumed Correct"
    
    var body: some View {
        
        // This one is for the order
        HStack(alignment: .center){
            Text("Order:")
            TextField("Enter Order", text: $nval, onCommit: self.Sum)
            
        }.padding()
        
        HStack{
            // This HStack that lists the sums and the errors
            
            VStack{
                // This VStack lists out the sums one below the other
                
                HStack{
                    
                    Text("Sum One:")
                    TextField("", text: $sum1String)
                    
                }.padding()
                
                HStack{
                    
                    Text("Sum Two:")
                    TextField("", text: $sum2String)
                    
                }.padding()
                
                HStack{
                    
                    Text("Sum Three:")
                    TextField("", text: $sum3String)
                    
                }.padding()
                
                VStack{
                    // This VStack lists out the errprs one below the other
                    
                    HStack{
                        
                        Text("Sum One Error:")
                        TextField("", text: $sum1ErrorString)
                        
                    }.padding()
                    
                    HStack{
                        
                        Text("Sum Two Error:")
                        TextField("", text: $sum2ErrorString)
                        
                    }.padding()
                    
                    HStack{
                        
                        Text("Sum Three Error:")
                        TextField("", text: $sum3ErrorString)
                        
                    }.padding()
                    
                }
                
                Button("Calculate Alternating Series", action: {self.Sum()} )

                
            }
            
            
            
            
        }
        
        
    
        
    }
    
    func Sum() {
        
        let correctInteger = Int((Double(nval)! + 0.5))
        
        let sum1val = alternatingSeries.Calculate1DFiniteSum(function: alternatingSeries.Sum1(n:), minimum: 1, maximum: correctInteger)
        let sum2val = alternatingSeries.Calculate1DFiniteSum(function: alternatingSeries.Sum2(n:), minimum: 1, maximum: correctInteger)
        let sum3val = alternatingSeries.Calculate1DFiniteSum(function: alternatingSeries.Sum3(n:), minimum: 1, maximum: correctInteger)
        
        let sum1error = alternatingSeries.ErrorCalculator(Val1: sum1val, Val2: sum3val)
        let sum2error = alternatingSeries.ErrorCalculator(Val1: sum2val, Val2: sum3val)
        
        sum1String = String(sum1val)
        sum2String = String(sum2val)
        sum3String = String(sum3val)
        
        sum1ErrorString = String(sum1error)
        sum2ErrorString = String(sum2error)

    }


}
