//
//  CryptoListWireframe.swift
//  coinmarketcap
//
//  Created Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit

class CryptoListWireFrame: CryptoListWireFrameProtocol {
    
    class func createCryptoListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "CryptosNavigationController")
        if let view = navController.childViewControllers.first as? CryptoListView {
            let presenter: CryptoListPresenterProtocol & CryptoListInteractorOutputProtocol = CryptoListPresenter()
            let interactor: CryptoListInteractorInputProtocol & CryptoListRemoteDataManagerOutputProtocol = CryptoListInteractor()
            let localDataManager: CryptoListLocalDataManagerInputProtocol = CryptoListLocalDataManager()
            let remoteDataManager: CryptoListRemoteDataManagerInputProtocol = CryptoListRemoteDataManager()
            let wireFrame: CryptoListWireFrameProtocol = CryptoListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentCryptoDetailScreen(from view: CryptoListViewProtocol, forCrypto crypto: CryptoModel) {
        let cryptoDetailViewController = CryptoDetailWireFrame.createCryptoDetailModule(forCrypto: crypto)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(cryptoDetailViewController, animated: true)
        }
    }
    
}
