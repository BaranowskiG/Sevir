//
//  ContentView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 04/04/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var balance = 1000
    
    var body: some View {
        VStack {
            topView
            ScrollView(showsIndicators: false) {
                ForEach(0..<15) { index in
                    GeometryReader { geo in
                        HStack {
                            Image(systemName: "circle")
                            Text("Item \(index)")
                            Spacer()
                            Text("$ 200")
                        }
                        .padding()
                        .background(Color.themeLight)
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                        .padding(.horizontal, geo.frame(in: .global).maxY * 0.09)
                        .foregroundColor(Color(#colorLiteral(red: 0.0431372549, green: 0.4039215686, blue: 0.2705882353, alpha: 1)))
                        .opacity(2.3 - Double(geo.frame(in: .global).maxY) * 0.003)
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 20, alignment: .center)
                    .padding()
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
                .foregroundColor(.themeSecondary)
            Text("$ \(balance)")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.themeLight)
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "arrow.up.right.circle.fill")
                            .foregroundColor(.themeLight)
                        Text("income")
                            .textCase(.uppercase)
                            .font(.footnote)
                            .foregroundColor(.themeSecondary)
                        Spacer()
                    }
                    HStack {
                        Text("$ 12,202")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.themeLight)
                            .padding(2)
                        Spacer()
                    }
                }
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.down.right.circle.fill")
                            .foregroundColor(.themeLight)
                        Text("expenses")
                            .textCase(.uppercase)
                            .font(.footnote)
                            .foregroundColor(.themeSecondary)
                    }
                    HStack {
                        Spacer()
                        Text("$ 0")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.themeLight)
                            .padding(2)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal, 30)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        HomeView()
        MainView()
    }
}
