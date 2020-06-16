//
//  ContentView.swift
//  ConcentricOnboardingExample
//
//  Created by Alisa Mylnikova on 28/08/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import SwiftUI
import ConcentricOnboarding

struct ContentView: View {

    var body: some View {
        let pages = (0...3).map { i in
            AnyView(PageView(title: MockData.title, imageName: MockData.imageNames[i], header: MockData.headers[i], content: MockData.contentStrings[i], textColor: MockData.textColors[i]))
        }

        var a = ConcentricOnboardingView(pages: pages, bgColors: MockData.colors)

//        a.didPressNextButton = {
//            a.goToPreviousPage(animated: true)
//        }
        a.insteadOfCyclingToFirstPage = {
            print("do your thing")
        }
        a.animationDidEnd = {

        }
        a.didGoToLastPage = {
        }
        return a
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
