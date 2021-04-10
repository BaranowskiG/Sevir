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
            LinearGradient(
                gradient: Gradient(colors: [.themeDark, .themeMain]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                switch currentViewIndex {
                case 0:
                    HomeView()
                case 1:
                    NewTransactionView()
                default:
                    ChartView()
                }
                Spacer()
            }
            VStack {
                Spacer()
                TabBarView(itemIndex: $currentViewIndex)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
