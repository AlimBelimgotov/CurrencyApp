//
//  Currency.swift
//  CurrencyApp
//
//  Created by Алим Куприянов on 19.11.2020.
//  Copyright © 2020 Алим Куприянов. All rights reserved.
//

import SwiftUI

struct Currency: Identifiable {
    
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
    
    
}


var currencies = ["USD", "EUR", "RUB", "CHF"]
