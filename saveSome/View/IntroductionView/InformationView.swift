//
//  InformationView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 08/01/2021.
//

import SwiftUI

struct InformationView: View {
    
    let title: String
    let description: String
    let imageName: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .padding()
                .accessibility(hidden: true)
                .foregroundColor(.themeTheLightest)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.themeTheLightest)
                    .accessibility(addTraits: .isHeader)
                Text(description)
                    .font(.body)
                    .foregroundColor(.themeLight)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(20)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(
            title: "Example",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            imageName: "person.fill"
        )
        .preferredColorScheme(.dark)
    }
}
