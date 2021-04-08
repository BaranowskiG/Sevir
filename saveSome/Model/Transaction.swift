//
//  Transaction.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import Foundation
import RealmSwift

class Transaction: Object {
    var id = UUID().uuidString
    var date = Date()
    var value: Int
    var title: String
    var category: String
    
    init(value: Int, title: String, category: String) {
        self.value = value
        self.title = title
        self.category = category
    }
    
}
