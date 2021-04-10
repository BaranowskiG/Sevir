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
                        .scaleEffect(index == 1 ? 2.4 : 2.0)
                        .foregroundColor(itemIndex == index ? Color.themeTheDarkest : Color.themeLight)
                        .padding(.horizontal, 25)
                })
            }
            .padding(.vertical, 3)
        }
        .padding()
        .background(Color.themeTheLightest)
        .cornerRadius(10)
        .shadow(color: .themeTheDarkest, radius: 5, x: 0, y: 5)        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
