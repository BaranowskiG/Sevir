//
//  IntroductionView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 08/01/2021.
//

import SwiftUI

struct IntroductionView: View {
    
    let staticText = ["Welcome to", "Save Some", "Continue"]
    @Binding var sawIntroductionView: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack {
                Text(staticText[0])
                    .fontWeight(.black)
                    .font(.system(size: 30))
                    .foregroundColor(.themeTheLightest)
                Text(staticText[1])
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .foregroundColor(.themeTheLightest)
            }
            Spacer()
            VStack(alignment: .leading) {
                ForEach(Constant.newUserTips, id: \.self) { tip in
                    InformationView(title: tip.title, description: tip.description, imageName: tip.imageName)
                }
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                sawIntroductionView = true
                UserDefaults.standard.set(true, forKey: "sawIntroductionView")
            }, label: {
                Text(staticText.last!)
                    .foregroundColor(.themeDark)
                    .font(.system(size: 20))
                    .fontWeight(.black)
            })
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .fill(Color.themeTheLightest)
                .cornerRadius(10)
                .shadow(color: .themeTheDarkest, radius: 5, x: 0, y: 5)
            )
            .padding(.horizontal, 50)
            Spacer()
        }
    }
}

