//
//  CryptoDetailView.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 15/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit
import Alamofire

class CryptoDetailView: UIViewController {
    
    @IBOutlet weak var titleCrypto: UILabel!
    @IBOutlet weak var change1h: UILabel!
    @IBOutlet weak var change24h: UILabel!
    @IBOutlet weak var dollarPrice: UILabel!
    @IBOutlet weak var btcPrice: UILabel!
    @IBOutlet weak var eurPrice: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: CryptoDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CryptoDetailView: CryptoDetailViewProtocol {
    func showCryptoDetail(forCrypto crypto: CryptoModel) {
        let priceEur : Float = Float(crypto.price_eur)!
        let priceDollar : Float = Float(crypto.price_usd)!
        titleCrypto.text = crypto.name
        var color24H : UIColor = UIColor.red
        let percentage24H =  Float(crypto.percent_change_24h)
        if percentage24H! >= 0 {
            color24H = UIColor.init(red: 1.0/255.0, green: 153.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        var color1H : UIColor = UIColor.red
        let percentage1H =  Float(crypto.percent_change_1h)
        if percentage1H! >= 0 {
            color1H = UIColor.init(red: 1.0/255.0, green: 153.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        change1h.text = "% Change last 1h: \(crypto.percent_change_1h)%"
        change24h.text = "% Change last 24h: \(crypto.percent_change_24h)%"
        change24h.textColor = color24H
        change1h.textColor = color1H
        dollarPrice.text = String(format:"Price Dollar: %.2f$", priceDollar)
        eurPrice.text = String(format:"Price Eur: %.2f€", priceEur)
        btcPrice.text = "Price Bitcoin: \(crypto.price_btc) BTC"
        let name = crypto.name.replacingOccurrences(of: " ", with: "-").lowercased()
        let url = URL(string: "\(API.baseImageUrl)\(API.bigImage)\(name).png")!
        imageView?.af_setImage(withURL: url, placeholderImage: nil)
    }
}

