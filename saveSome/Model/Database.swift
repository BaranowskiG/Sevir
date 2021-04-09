//
//  Database.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 09/04/2021.
//

import Foundation
import RealmSwift

struct Database {
    let realm = try! Realm()
    
    func getAll() -> Results<Transaction> {
        return realm.objects(Transaction.self).sorted(byKeyPath: "date", ascending: false)
    }
    
    func post(transaction: Transaction) {
        try! realm.write {
            realm.add(transaction)
        }
    }
}
