//
//  Tip.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 08/01/2021.
//

import Foundation

struct Tip: Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}
