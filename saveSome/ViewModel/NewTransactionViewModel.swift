//
//  NewTransactionViewModel.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 10/04/2021.
//

import Foundation
import SwiftUI

class NewTransactionViewModel: ObservableObject {
    @Published var database = Database()
    
    func postNewTransaction(amount: Int, title: String, category: String) {
        let newTransaction = Transaction(amount: amount, title: title, category: category)
        database.post(transaction: newTransaction)
    }
}
