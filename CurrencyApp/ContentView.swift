//
//  ContentView.swift
//  CurrencyApp
//
//  Created by Алим Куприянов on 19.11.2020.
//  Copyright © 2020 Алим Куприянов. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Currency")
                .preferredColorScheme(.dark)
            
        }
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
