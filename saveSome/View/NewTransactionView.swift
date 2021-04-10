//
//  NewTransactionView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 06/04/2021.
//

import SwiftUI

enum TransactionType {
    case income
    case expenses
}

struct NewTransactionView: View {
    
    @ObservedObject var newTransactionviewModel = NewTransactionViewModel()
    
    @State private var category = "dollarsign.circle"
    @State private var title = ""
    @State private var amount = ""
    @State private var type: TransactionType = .income
    
    let categories = [
        "flame",
        "drop",
        "house",
        "gamecontroller",
        "bolt.car",
        "leaf",
        "dollarsign.circle",
        "pc",
        "figure.stand",
        "mic"
    ]
    
    
    init() {
        UISegmentedControl
            .appearance()
            .setTitleTextAttributes(
                [.foregroundColor: UIColor(Color.themeTheLightest)], for: .normal
            )
        UISegmentedControl
            .appearance()
            .setTitleTextAttributes(
                [.foregroundColor: UIColor(Color.themeTheDarkest)], for: .selected
            )
    }
    
    
    var body: some View {
        VStack {
            Text("new transaction")
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.themeTheLightest)
                .textCase(.uppercase)
                .padding()
                .padding(.bottom, 20)
            Text("type to change value")
                .textCase(.uppercase)
                .font(.footnote)
                .padding(1)
                .foregroundColor(.themeLight)
            HStack {
                Image(systemName: "\(category)")
                TextField(type == .income ? "Salary" : "New PC", text: $title)
                TextField(type == .income ? "$2000" : "$750", text: $amount)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                
            }
            .padding()
            .background(Color.themeTheLightest)
            .cornerRadius(10)
            .padding(.vertical, 5)
            .scaleEffect(0.9)
            .foregroundColor(type == .income ? .themeTheDarkest : .red)
            .opacity(1.0)
            .shadow(color: .themeTheDarkest, radius: 3, x: 0, y: 3)
            .padding(.horizontal)
            
            
            Picker(selection: $type, label: Text("Picker")) {
                Text("income").tag(TransactionType.income)
                Text("expenses").tag(TransactionType.expenses)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.horizontal)
            .foregroundColor(.themeTheDarkest)
            .padding(.bottom, 20)
            

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], alignment: .center, spacing: 10) {
                ForEach(categories, id: \.self) { cat in
                    Image(systemName: cat)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25, alignment: .center)
                        .padding()
                        .foregroundColor(.themeTheLightest)
                        .onTapGesture {
                            category = cat
                        }
                }
            }
            .padding()
            
            
            Button(action: {
                newTransactionviewModel.postNewTransaction(
                    amount: type == .income ? Int(amount)! : -Int(amount)!,
                    title: title,
                    category: category
                )
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                title = ""
                amount = ""
                category = "dollarsign.circle"
            }, label: {
                Text("create")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.themeTheDarkest)
                    .textCase(.uppercase)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.themeTheLightest)
                    .cornerRadius(10)
            })
            .shadow(color: .themeTheDarkest, radius: 3, x: 0, y: 3)

            Spacer()
        }
    }
}

struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView()
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
