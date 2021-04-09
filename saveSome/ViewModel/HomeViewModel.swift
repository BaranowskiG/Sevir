//
//  HomeViewModel.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 09/04/2021.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var database = Database()
    @Published var money = Money()
    
    func updateMoneyStatus() {
        let transactions = database.getAll()
        money.update(from: transactions)
    }
    
    func getIncome() -> Int {
        return money.income
    }
    
    func getExpenses() -> Int {
        return money.expenses
    }
    
    func getCurrentBalance() -> Int {
        return money.currentBalance
    }
    
}
