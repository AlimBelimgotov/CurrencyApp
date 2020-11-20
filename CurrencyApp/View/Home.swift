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
        ScrollView {
            
            VStack(alignment: .leading, spacing: 15, content: {
               ForEach(viewModel.conversionData){rate in
                 Text(rate.currencyName)
            
                }
            })
                
            
        }

    }
}

@available(iOS 14.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
