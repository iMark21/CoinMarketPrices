//
//  CryptoDetailPresenter.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 15/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit

class CryptoDetailPresenter: CryptoDetailPresenterProtocol {
    var view: CryptoDetailViewProtocol?
    var wireFrame: CryptoDetailWireFrameProtocol?
    var crypto: CryptoModel?
    
    func viewDidLoad(){
        view?.showCryptoDetail(forCrypto: crypto!)
    }
}
