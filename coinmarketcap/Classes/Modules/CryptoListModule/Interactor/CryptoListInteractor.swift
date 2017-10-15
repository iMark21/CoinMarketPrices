//
//  CryptoListInteractor.swift
//  coinmarketcap
//
//  Created Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import Foundation

class CryptoListInteractor: CryptoListInteractorInputProtocol {
    weak var presenter: CryptoListInteractorOutputProtocol?
    var localDatamanager: CryptoListLocalDataManagerInputProtocol?
    var remoteDatamanager: CryptoListRemoteDataManagerInputProtocol?
    
    func retrieveCryptoList() {
        remoteDatamanager?.retrieveCryptoList()
//        do {
//            //TO-DO CHECK IF LOCAL DATA
//            remoteDatamanager?.retrieveCryptoList()
//        } catch {
//            presenter?.didRetrieveCryptos([])
//        }
    }
}

extension CryptoListInteractor:CryptoListRemoteDataManagerOutputProtocol {
    
    func onCryptosRetrieved(_ cryptos: [CryptoModel]) {
        presenter?.didRetrieveCryptos(cryptos)
        //TO-DO SAVE DATA TO LOCAL
    }
    
    func onError() {
        presenter?.onError()
    }
    
}

