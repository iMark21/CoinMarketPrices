//
//  CryptoTableViewCell.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit
import AlamofireImage

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var crytpoImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var percentagaLabel: UILabel!
    
    func set(forCrypto crypto: CryptoModel) {
        self.selectionStyle = .none
        titleLabel?.text = crypto.name
        let price : Float = Float(crypto.price_eur)!
        currentPriceLabel?.text = String(format:"Price: %.2f€", price)
        percentagaLabel?.text = "% Change last 24h: \(crypto.percent_change_24h)%"
        rankLabel.text = crypto.rank
        var color : UIColor = UIColor.red
        let percentage =  Float(crypto.percent_change_24h)
        if percentage! >= 0 {
            color = UIColor.init(red: 1.0/255.0, green: 153.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        percentagaLabel.textColor = color
        let name = crypto.name.replacingOccurrences(of: " ", with: "-").lowercased()
        let url = URL(string: "\(API.baseImageUrl)\(API.smallImage)\(name).png")!
        crytpoImageView?.af_setImage(withURL: url, placeholderImage: nil)
    }
}
