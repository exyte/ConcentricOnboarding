//
//  AnimatableShape.swift
//  ConcentricOnboarding
//
//  Created by Daniil Manin on 21.09.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct AnimatableShape: Shape {
    
    enum AnimationType {
        case growing, shrinking
    }
    
    var progress: Double
    let radius: Double
    let limit: Double
    let direction: Direction
    
    var animatableData: CGFloat {
        get { CGFloat(progress) }
        set { progress = Double(newValue) }
    }
    
    // MARK: - Path
    
    func path(in rect: CGRect) -> Path {
        let (type, progress) = localValues()
        let r: CGFloat
        let delta: CGFloat
        let center: CGPoint
        
        if type == .growing {
            r = CGFloat(radius + pow(2, progress))
            delta = CGFloat((1 - progress / limit) * radius)
            center = CGPoint(x: UIScreen.main.bounds.width / 2 + r - delta - 2.0, y: UIScreen.main.bounds.height / 2)
        } else {
            r = CGFloat(radius + pow(2, (limit - progress)))
            delta = CGFloat((progress / limit) * radius)
            center = CGPoint(x: UIScreen.main.bounds.width / 2 - r + delta, y: UIScreen.main.bounds.height / 2)
        }
        
        let rect = CGRect(x: center.x - r, y: center.y - r, width: 2 * r, height: 2 * r)
        return Circle().path(in: rect)
    }
    
    // MARK: - Private
    
    private func localValues() -> (type: AnimationType, progress: Double) {
        if direction == .forward {
            if progress <= limit {
                return (.growing, progress)
            } else if progress <= 2 * limit {
                return (.shrinking, progress - limit)
            } else {
                return (.growing, 0)
            }
        } else {
            if progress <= limit {
                return (.shrinking, limit - progress)
            } else if progress <= 2 * limit {
                return (.growing, 2 * limit - progress)
            } else {
                return (.shrinking, 0)
            }
        }
    }
}
