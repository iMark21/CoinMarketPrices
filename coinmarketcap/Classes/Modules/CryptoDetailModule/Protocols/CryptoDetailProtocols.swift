//
//  CryptoDetailProtocols.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 15/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit

protocol CryptoDetailViewProtocol: class {
    var presenter: CryptoDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCryptoDetail(forCrypto crypto: CryptoModel)
}

protocol CryptoDetailWireFrameProtocol: class {
    static func createCryptoDetailModule(forCrypto crypto: CryptoModel) -> UIViewController
}

protocol CryptoDetailPresenterProtocol: class {
    var view: CryptoDetailViewProtocol? { get set }
    var wireFrame: CryptoDetailWireFrameProtocol? { get set }
    var crypto: CryptoModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
