//
//  CryptoListRemoteDataManager.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class CryptoListRemoteDataManager:CryptoListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CryptoListRemoteDataManagerOutputProtocol?
    
    func retrieveCryptoList() {
        Alamofire
            .request(APIEndpoints.List.listEndPoint.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[CryptoModel]>) in
                switch response.result {
                case .success(let cryptos):
                    self.remoteRequestHandler?.onCryptosRetrieved(cryptos)
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
