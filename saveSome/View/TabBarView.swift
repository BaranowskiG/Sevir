//
//  TabBarView.swift
//  saveSome
//
//  Created by Grzegorz Baranowski on 06/04/2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var itemIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<Constant.tabIcon.count) { index in
                Button(action: {
                    itemIndex = index
                }, label: {
                    Image(systemName: Constant.tabIcon[index])
                        .scaleEffect(index == 1 ? 2.6 : 1.8)
                        .foregroundColor(itemIndex == index ? Color.themeDark : Color.themeLight)
                        .padding(.horizontal, 20)
                })
            }
            .padding(.vertical, 5)
        }
        .padding()
        .background(Color.themeTheLightest)
        .cornerRadius(30)
        .shadow(color: .themeTheDarkest, radius: 5, x: 0, y: 5)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
