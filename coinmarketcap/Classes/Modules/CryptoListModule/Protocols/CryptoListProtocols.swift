//
//  CryptoListProtocols.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit

protocol CryptoListViewProtocol: class {
    var presenter: CryptoListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCryptos(with cryptos: [CryptoModel])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol CryptoListWireFrameProtocol: class {
    static func createCryptoListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentCryptoDetailScreen(from view: CryptoListViewProtocol, forCrypto crypto: CryptoModel)
}

protocol CryptoListPresenterProtocol: class {
    var view: CryptoListViewProtocol? { get set }
    var interactor: CryptoListInteractorInputProtocol? { get set }
    var wireFrame: CryptoListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showCryptoDetail(forCrypto crypto: CryptoModel)
}

protocol CryptoListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveCryptos(_ cryptos: [CryptoModel])
    func onError()
}

protocol CryptoListInteractorInputProtocol: class {
    var presenter: CryptoListInteractorOutputProtocol? { get set }
    var localDatamanager: CryptoListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CryptoListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveCryptoList()
}

protocol CryptoListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol CryptoListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: CryptoListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveCryptoList()
}

protocol CryptoListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onCryptosRetrieved(_ cryptos: [CryptoModel])
    func onError()
}

protocol CryptoListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
