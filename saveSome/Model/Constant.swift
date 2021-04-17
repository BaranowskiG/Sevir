//
//  Constant.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 06/04/2021.
//

import Foundation
import SwiftUI

struct Constant {
    static let tabIcon = ["house.fill", "plus.square.fill", "gearshape.fill"]
    
    static let mainGradient = Gradient(colors: [.themeDark, .themeMain])
    
    static let newUserTips = [
        Tip(title: "business", description: "It's so easy to get lost in the bils, but not with \"Save Some\".", imageName: "bitcoinsign.circle"),
        Tip(title: "Hobby", description: "You are able to earn extra money from painting? Cool!", imageName: "paintbrush.pointed"),
        Tip(title: "Home", description: "Interior renovation.. and new TV? Don't overdo it.", imageName: "house")
    ]
    
}
