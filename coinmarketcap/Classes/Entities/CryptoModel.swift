//
//  CryptoModel.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import Foundation
import ObjectMapper

struct CryptoModel {
    var id = 0
    var name = ""
    var symbol = ""
    var rank = ""
    var price_usd = ""
    var price_eur = ""
    var price_btc = ""
    var available_supply = ""
    var market_cap_usd = ""
    var total_supply = ""
    var percent_change_1h = ""
    var percent_change_24h = ""
    var percent_change_7d = ""
    var last_updated = ""
}

extension CryptoModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        symbol <- map["symbol"]
        rank <- map["rank"]
        price_usd <- map["price_usd"]
        price_eur <- map["price_eur"]
        price_btc <- map["price_btc"]
        market_cap_usd <- map["market_cap_usd"]
        available_supply <- map["available_supply"]
        total_supply <- map["total_supply"]
        percent_change_1h <- map["percent_change_1h"]
        percent_change_24h <- map["percent_change_24h"]
        percent_change_7d <- map["percent_change_7d"]
        last_updated <- map["last_updated"]
    }
}


