//
//  Overview.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 11/04/2021.
//

import SwiftUI

struct OverviewView: View {
    
    @ObservedObject var homeViewModel = OverviewViewModel()
    
    var body: some View {
        VStack {
            currentBalanceView
            HStack {
                incomeView
                Spacer()
                expensesView
            }
            .padding()
        }
        .padding(.horizontal, 30)
        .onAppear {
            homeViewModel.updateMoneyStatus()
        }
    }
    
    var currentBalanceView: some View {
        VStack {
            Text("current balance")
                .textCase(.uppercase)
                .font(.footnote)
                .padding(1)
                .foregroundColor(.themeTheLightest)
            Text("$\(homeViewModel.getCurrentBalance())")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.themeTheLightest)
        }
    }
    
    var incomeView: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.up.right.circle.fill")
                    .foregroundColor(.themeTheLightest)
                Text("income")
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundColor(.themeTheLightest)
                Spacer()
            }
            HStack {
                Text("$\(homeViewModel.getIncome())")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.themeTheLightest)
                    .padding(2)
                Spacer()
            }
        }
    }
    
    var expensesView: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "arrow.down.right.circle.fill")
                    .foregroundColor(.themeTheLightest)
                Text("expenses")
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundColor(.themeTheLightest)
            }
            HStack {
                Spacer()
                Text("$\(abs(homeViewModel.getExpenses()))")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.themeTheLightest)
                    .padding(2)
            }
        }
    }
    
    
    
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
