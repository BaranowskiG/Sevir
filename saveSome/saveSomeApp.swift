//
//  saveSomeApp.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import SwiftUI

@main
struct saveSomeApp: App {
    
    @State var sawIntroductionView = UserDefaults.standard.bool(forKey: "sawIntroductionView")
    
    var body: some Scene {
        WindowGroup {
            if !sawIntroductionView {
                IntroductionView(sawIntroductionView: $sawIntroductionView)
                    .background(LinearGradient(gradient: Constant.mainGradient, startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
            } else {
                MainView()
            }
        }
    }
}
