//
//  PriceManager.swift
//  Bitcoin Prices
//
//  Created by Elena Sadler on 11/2/20.
//

import Foundation

struct PriceManager {
    let currentURL = "https://api.coindesk.com/v1/bpi/currentprice.json"
    let previousDayURL = "https://api.coindesk.com/v1/bpi/historical/close.json"
    
    
    func fetchPrices(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                if let safeData = data {
                    if let priceObject = self.parseJSON(safeData) {
                        
                        print("sucess")

                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ priceData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PriceModel.self, from: priceData)
            let time = decodedData.time
            let bpi = decodedData.bpi.usd
            print(time)
            print(bpi)
        } catch {
            print("yikes")
        }
    }
    
    
}
