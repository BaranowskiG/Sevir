//
//  ContentView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    let test: [Transaction] = [
        Transaction(amount: 125, title: "Grocery", category: "drop.fill"),
        Transaction(amount: 12402124, title: "Car", category: "car.fill"),
        Transaction(amount: -15, title: "Apples", category: "applelogo"),
        Transaction(amount: -1351452, title: "watch", category: "applewatch.watchface"),
        Transaction(amount: 1245, title: "Grocery", category: "drop"),
        Transaction()
    ]
    
    var body: some View {
        VStack {
            topView
                .shadow(color: .themeTheDarkest, radius: 2, x: 0, y: 3)
            ScrollView(showsIndicators: false) {
                ForEach(homeViewModel.database.getAll()) { trans in
                    GeometryReader { geo in
                        HStack {
                            Image(systemName: "\(trans.category)")
                            Text("\(trans.title)")
                            Spacer()
                            Text("$ \(trans.amount)")
                        }
                        .padding()
                        .background(Color.themeTheLightest)
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                        .scaleEffect(1.1 - geo.frame(in: .global).maxY * 0.0006)
                        .foregroundColor(.themeTheDarkest)
                        .opacity(2.3 - Double(geo.frame(in: .global).maxY) * 0.0028)
                        .shadow(color: .themeTheDarkest, radius: 3, x: 0, y: 3)
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 20, alignment: .center)
                    .padding()
                    .padding(.vertical, 5)
                }
            }
            
        }
        .padding()
    }
    
    
    
    var topView: some View {
        VStack {
            Text("current balance")
                .textCase(.uppercase)
                .font(.footnote)
                .padding(1)
                .foregroundColor(.themeLight)
            Text("$ \(homeViewModel.getCurrentBalance())")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.themeTheLightest)
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "arrow.up.right.circle.fill")
                            .foregroundColor(.themeTheLightest)
                        Text("income")
                            .textCase(.uppercase)
                            .font(.footnote)
                            .foregroundColor(.themeLight)
                        Spacer()
                    }
                    HStack {
                        Text("$ \(homeViewModel.getIncome())")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.themeTheLightest)
                            .padding(2)
                        Spacer()
                    }
                }
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.down.right.circle.fill")
                            .foregroundColor(.themeTheLightest)
                        Text("expenses")
                            .textCase(.uppercase)
                            .font(.footnote)
                            .foregroundColor(.themeLight)
                    }
                    HStack {
                        Spacer()
                        Text("$ \(homeViewModel.getExpenses())")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.themeTheLightest)
                            .padding(2)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal, 30)
        .onAppear {
            homeViewModel.updateMoneyStatus()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        HomeView()
        MainView()
    }
}
