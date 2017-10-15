//
//  CryptoListPresenter.swift
//  coinmarketcap
//
//  Created Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import Foundation

class CryptoListPresenter: CryptoListPresenterProtocol {
    weak var view: CryptoListViewProtocol?
    var interactor: CryptoListInteractorInputProtocol?
    var wireFrame: CryptoListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveCryptoList()
    }
    func showCryptoDetail(forCrypto crypto: CryptoModel) {
        wireFrame?.presentCryptoDetailScreen(from: view!, forCrypto: crypto)
    }
}

extension CryptoListPresenter: CryptoListInteractorOutputProtocol {
    func didRetrieveCryptos(_ cryptos: [CryptoModel]) {
        view?.hideLoading()
        view?.showCryptos(with: cryptos)
    }
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}

