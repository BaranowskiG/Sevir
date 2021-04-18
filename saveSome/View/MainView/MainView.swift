//
//  MainView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 06/04/2021.
//

import SwiftUI

struct MainView: View {
    @State var currentViewIndex = 0
    
    var body: some View {
        ZStack {
            backgroundGradient
            currentView
            tabBar
                .padding()
                .ignoresSafeArea(.keyboard)
        }
    }
    
    private var backgroundGradient: some View {
        LinearGradient(gradient: Constant.mainGradient, startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
    
    private var currentView: some View {
        VStack {
            switch currentViewIndex {
            case 0:
                HomeView()
            case 1:
                NewTransactionView()
            default:
                SettingsView()
            }
            Spacer()
        }
    }
    
    private var tabBar: some View {
        VStack {
            Spacer()
            TabBarView(itemIndex: $currentViewIndex)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
