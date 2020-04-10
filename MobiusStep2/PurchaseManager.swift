//
//  PurchaseManager.swift
//  MobiusStep2
//
//  Created by Rasul Tataev on 10/04/2020.
//  Copyright © 2020 RSY. All rights reserved.
//

import Foundation

final class PurchaseManager {
    var didChangeMoneyAmount: ((Int) -> Void)? = nil
    
    private(set) var currentMoney: Int {
        didSet {
            didChangeMoneyAmount?(currentMoney)
        }
    }
    
    init() {
        currentMoney = 200
    }
    
    func addFunds(_ amount: Int) {
        currentMoney += amount
    }
    
    func spend(_ amount: Int) {
        guard currentMoney >= amount else {
            return
        }
        currentMoney -= amount
        print("spent \(amount). current \(currentMoney)")
    }
}
