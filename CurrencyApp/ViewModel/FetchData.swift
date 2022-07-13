//
//  FetchData.swift
//  CurrencyApp
//
//  Created by Алим Куприянов on 19.11.2020.
//  Copyright © 2020 Алим Куприянов. All rights reserved.
//

import SwiftUI

 final class FetchData: ObservableObject {
    
    @Published var conversionData: [Currency] = []
    @Published var base = "USD"
    
    init() {
        fetch()
    }
    
     private func fetch() {
        
        let url =  URL(string: "https://api.apilayer.com/exchangerates_data/latest&base=\(base)")
        guard let url = url else { return }
         
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("oXAOXWQJTpc25W4nY0rFG7a6xNobYrin", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            print(String(data: data, encoding: .utf8)!)

            do {
                let conversion = try JSONDecoder().decode(Conversion.self, from: data)
                print(conversion)
                
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap({ (key, value) -> Currency? in
                        return Currency(currencyName: key, currencyValue: value)
                    })
                }
            }
            catch {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
    }
    
    
    func updateData(base:String) {
        self.base = base
        self.conversionData.removeAll()
        fetch()
    }
}


