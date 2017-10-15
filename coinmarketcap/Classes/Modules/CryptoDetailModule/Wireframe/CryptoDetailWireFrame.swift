//
//  CryptoDetailWireFrame.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 15/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit

class CryptoDetailWireFrame: CryptoDetailWireFrameProtocol {
    static func createCryptoDetailModule(forCrypto crypto: CryptoModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CryptoDetailView")
        if let view = viewController as? CryptoDetailView {
            let presenter: CryptoDetailPresenterProtocol = CryptoDetailPresenter()
            let wireFrame: CryptoDetailWireFrameProtocol = CryptoDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.crypto = crypto
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
