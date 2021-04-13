//
//  ChartView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 06/04/2021.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("REMEMBER:")
                        .padding(5)
                        .foregroundColor(.themeTheLightest)
                    Spacer()
                }
                HStack {
                Text("Once you delete you data, there is no going back. Please be certain.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.themeTheLightest)
                    .padding(5)
                Spacer()
                }
                
                Button(action: {
                    settingsViewModel.deleteAllTransactions()
                }, label: {
                    Text("reset data")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.red)
                        .textCase(.uppercase)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.themeTheLightest)
                        .cornerRadius(10)
                })
                .padding()
            }
            .padding()
            .background(Color(red: 1.0, green: 0.2, blue: 0.2, opacity: 0.8))
            .cornerRadius(10)
            .padding()
                           
            VStack {
                HStack {
                    Text("this app is 100% free")
                        .padding(5)
                        .textCase(.uppercase)
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                Text("If you want to see more apps like this one, please:")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .padding(5)
                Spacer()
                }
                
                Button(action: {
                    settingsViewModel.openWebsite()
                }, label: {
                    Text("buy me a coffee")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 1, green: 221/255, blue: 3/255))
                        .textCase(.uppercase)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.8))
                        .cornerRadius(10)
                })
                .padding()
            }
            .padding()
            .background(Color(red: 1, green: 221/255, blue: 3/255, opacity: 0.7))
            .cornerRadius(10)
            .padding()
            
            
            
            Spacer()
        }
        .padding(20)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.themeDark, .themeMain]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
    }
}
