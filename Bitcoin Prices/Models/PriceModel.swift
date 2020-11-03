//
//  PriceModel.swift
//  Bitcoin Prices
//
//  Created by Elena Sadler on 11/2/20.
//

import Foundation
struct PriceModel: Decodable {
    let time: Time
    let bpi: BPI
}

struct Time: Decodable {
    let updated: String
}

struct BPI: Decodable {
    let usd: Float
}
