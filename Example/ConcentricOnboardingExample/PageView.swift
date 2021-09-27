//
//  PageView.swift
//  ConcentricOnboardingExample
//
//  Created by Daniil Manin on 20.09.2021.
//

import SwiftUI

struct PageView: View {
    
    let page: PageData
    let imageWidth: CGFloat = 150
    let textWidth: CGFloat = 350
    
    var body: some View {
        let size = UIImage(named: page.imageName)?.size ?? .zero
        let aspect = size.width / size.height
        
        return VStack(alignment: .center, spacing: 50) {
            Text(page.title)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(page.textColor)
                .frame(width: textWidth)
                .multilineTextAlignment(.center)
            Image(page.imageName)
                .resizable()
                .aspectRatio(aspect, contentMode: .fill)
                .frame(width: imageWidth, height: imageWidth)
                .cornerRadius(40)
                .clipped()
            VStack(alignment: .center, spacing: 5) {
                Text(page.header)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(page.textColor)
                    .frame(width: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                Text(page.content)
                    .font(Font.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(page.textColor)
                    .frame(width: 300, alignment: .center)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
