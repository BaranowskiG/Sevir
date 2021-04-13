//
//  ContentView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            OverviewView()
            transactinsList
        }
        .padding()
    }
    
    var transactinsList: some View {
        ScrollView(showsIndicators: false) {
            ForEach(homeViewModel.database.getAll()) { trans in
                GeometryReader { geo in
                    HStack {
                        Image(systemName: "\(trans.category)")
                        Text("\(trans.title)")
                        Spacer()
                        if trans.amount < 0 {
                            Text("- $\(abs(trans.amount))")
                        } else {
                            Text("$\(trans.amount)")
                        }
                    }
                    .padding()
                    .background(Color.themeTheLightest)
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                    .scaleEffect(1.1 - geo.frame(in: .global).maxY * 0.0006)
                    .foregroundColor(trans.amount > 0 ?.themeTheDarkest : .red)
                    .opacity(2.3 - Double(geo.frame(in: .global).maxY) * 0.0028)
                    .shadow(color: .themeTheDarkest, radius: 3, x: 0, y: 3)
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 20, alignment: .center)
                .padding()
                .padding(.vertical, 5)
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
