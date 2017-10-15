//
//  CryptoListViewController.swift
//  coinmarketcap
//
//  Created Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import UIKit
import PKHUD

class CryptoListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: CryptoListPresenterProtocol?
    var cryptoList: [CryptoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension CryptoListView: CryptoListViewProtocol {
    
    func showCryptos(with cryptos: [CryptoModel]) {
        cryptoList = cryptos
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension CryptoListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let crypto = cryptoList[indexPath.row]
        cell.set(forCrypto: crypto)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showCryptoDetail(forCrypto: cryptoList[indexPath.row])
    }
    
}
