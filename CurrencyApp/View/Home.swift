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
                                
                                Text(rate.currencyName)
                            }
                            .padding(.horizontal)
                        }
                    })
                    .padding(.top)
                    
                }
            }
        }
    }
    
    
    
    
    func getFlag(currency: String) ->String {
        
        var base = 127397
        var scalar = String.UnicodeScalarView()
        
        for i in currency.utf16{
            
           scalar.append(UnicodeScalar(base + Int(i))!)
        }
        
        return String(scalar)
    }
}
       

    
   






//@available(iOS 14.0, *)
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
