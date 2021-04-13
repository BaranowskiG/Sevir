//
//  SettingsViewModel.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 11/04/2021.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var database = Database()
    
    func deleteAllTransactions() {
        database.deleteAll()
    }
    
    func openWebsite() {
        guard let url = URL(string: "https://www.buymeacoffee.com/someCompa") else { return }
        UIApplication.shared.open(url)
    }
}
