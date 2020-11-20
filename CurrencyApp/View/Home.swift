//
//  Home.swift
//  CurrencyApp
//
//  Created by Алим Куприянов on 19.11.2020.
//  Copyright © 2020 Алим Куприянов. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)

struct Home: View {
    @StateObject var viewModel = FetchData()
    
    var body: some View {
        VStack {
            
            if viewModel.conversionData.isEmpty {
                ProgressView()
            }
            else {
                ScrollView {
                    
                    LazyVStack(alignment: .leading, spacing: 15, content: {
                        ForEach(viewModel.conversionData){rate in
                            
                            HStack(spacing: 15) {
                                
                                Text(getFlag(currency: rate.currencyName))
                                    .font(.system(size: 65))
                                VStack(alignment: .leading, spacing: 5, content: {
                                    
                                    Text(rate.currencyName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text("\(rate.currencyValue)")
                                        .fontWeight(.heavy)
                                    
                                })
                            }
                            .padding(.horizontal)
                        }
                    })
                    .padding(.top)
                    
                }
            }
        }
        .toolbar(content: {
            
            Menu(content: {
                
                ForEach(currencies,id: \.self) {name in
                    Button(action: {viewModel.updateData(base: name)}, label: {
                        Text(name)
                    })
                }
                
            }) {
                Text("Base \(viewModel.base)")
                    .fontWeight(.heavy)
            }
        })
}
    
    
    func getFlag(currency: String) ->String {
        
        var base = 127397
        var code = currency
        code.removeLast()
        
        var scalar = String.UnicodeScalarView()
        
        for i in code.utf16{
            
           scalar.append(UnicodeScalar(base + Int(i))!)
        }
        
        return String(scalar)
    }
}
       

    
   






@available(iOS 14.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
       Home()
    }
}
