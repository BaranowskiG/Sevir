//
//  Money.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 09/04/2021.
//

import Foundation
import RealmSwift

struct Money {
    var income = 0
    var expenses = 0
    var currentBalance = 0
    
    
    mutating func update(from transactions: Results<Transaction>){
        for transaction in transactions {
            if transaction.amount > 0 {
                income += transaction.amount
            } else {
                expenses += transaction.amount
            }
            currentBalance += transaction.amount
        }
    }
}
