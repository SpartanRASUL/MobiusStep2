//
//  ViewController.swift
//  MobiusStep2
//
//  Created by Rasul Tataev on 10/04/2020.
//  Copyright © 2020 RSY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        purchaseManager.didChangeMoneyAmount = { [weak self] newAmount in
            self?.moneyLabel.text = String(newAmount)
        }
        moneyLabel.text = String(purchaseManager.currentMoney)
    }
    
    //MARK: - Private
    private let purchaseManager = PurchaseManager()
    
    @IBOutlet var moneyLabel: UILabel!
    
    @IBAction private func addFundsPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Purchase Manager", message: "Please spend your money on us", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add 300", style: .default, handler: { [weak self] _ in
            self?.purchaseManager.addFunds(300)
        }))
        alert.addAction(UIAlertAction(title: "Add 500", style: .default, handler: { [weak self] _ in
            self?.purchaseManager.addFunds(500)
        }))
        alert.addAction(UIAlertAction(title: "Add 900", style: .default, handler: { [weak self] _ in
            self?.purchaseManager.addFunds(900)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    @IBAction private func buyInAppItemPressed(_ sender: UIButton) {
        let price = 200
        guard purchaseManager.currentMoney >= price else {
            return
        }
        purchaseManager.spend(price)
    }
}

