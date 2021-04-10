//
//  Transaction.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import Foundation
import RealmSwift

class Transaction: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date = Date()
    @objc dynamic var amount: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var category: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(amount: Int, title: String, category: String) {
        self.init()
        self.amount = amount
        self.title = title
        self.category = category
    }
}
