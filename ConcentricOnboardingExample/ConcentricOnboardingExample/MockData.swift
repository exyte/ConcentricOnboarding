//
//  MockData.swift
//  ConcentricOnboardingExample
//
//  Created by Daniil Manin on 20.09.2021.
//

import UIKit
import SwiftUI

struct PageData {
    let title: String
    let header: String
    let content: String
    let imageName: String
    let color: Color
    let textColor: Color
}

struct MockData {
    static let pages: [PageData] = [
        PageData(
            title: "Eating grapes 101",
            header: "Step 1",
            content: "Break off a branch holding a few grapes and lay it on your plate.",
            imageName: "screen 1",
            color: Color(hex: "F38181"),
            textColor: Color(hex: "FFFFFF")),
        PageData(
            title: "Eating grapes 101",
            header: "Step 2",
            content: "Put a grape in your mouth whole.",
            imageName: "screen 2",
            color: Color(hex: "FCE38A"),
            textColor: Color(hex: "4A4A4A")),
        PageData(
            title: "Eating grapes 101",
            header: "Step 3",
            content: "Deposit the seeds into your thumb and first two fingers.",
            imageName: "screen 3",
            color: Color(hex: "95E1D3"),
            textColor: Color(hex: "4A4A4A")),
        PageData(
            title: "Eating grapes 101",
            header: "Step 4",
            content: "Place the seeds on your plate.",
            imageName: "screen 4",
            color: Color(hex: "EAFFD0"),
            textColor: Color(hex: "4A4A4A")),
    ]
}

/// Color converter from hex string to SwiftUI's Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
