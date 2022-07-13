//
//  Conversion.swift
//  CurrencyApp
//
//  Created by Алим Куприянов on 19.11.2020.
//  Copyright © 2020 Алим Куприянов. All rights reserved.
//

import SwiftUI

struct Conversion: Decodable {
   
    var rates : [String: Double]
    var date : String
    var base : String
}

