//
//  ContentView.swift
//  ConcentricOnboarding
//
//  Created by Alisa Mylnikova on 30/07/2019.
//  Copyright © 2019 Exyte. All rights reserved.
//

import SwiftUI

enum Direction {
    case forward, backward
}

public struct ConcentricOnboardingView<Content>: View, Animatable where Content: View {
    
    public typealias PageContent = (view: Content, background: Color)
    
    let pageContents: [PageContent]
    
    @State private var currentIndex: Int = 0
    @State private var nextIndex: Int = 1
    @State private var progress: Double = 0
    @State private var direction: Direction = .forward
    @State private var isAnimated: Bool = false
    @State private var circleColor: Color = .clear
    @State private var backgroundColor: Color = .clear
    
    /// defaults setups, will be change via modifiers
    private var nextIcon: String = "chevron.forward"
    private var duration: Double = 1.0
    
    /// called before animation starts
    private var animationWillBegin: () -> Void = { }
    
    /// called after animation ends
    private var animationDidEnd: () -> Void = { }
    
    /// called after animation leading to last page ends
    private var didGoToLastPage: () -> Void = { }
    
    /// replaces default navigation to first page after pressing next on last page
    private var insteadOfCyclingToFirstPage: (() -> Void)?
    
    /// replaces default navigation to last page after pressing prev on first page while navigating backwards
    private var insteadOfCyclingToLastPage: (() -> Void)?
    
    /// replaces default button action with user's custom closure
    private var didPressNextButton: (() -> Void)?
    
    /// replaces default button action with user's custom closure
    private var didChangeCurrentPage: ((Int) -> Void)?
    
    /// animation's settings
    private let radius: Double = 30
    private let limit: Double = 15
    private var inAnimation: Animation { .easeIn(duration: duration / 2) }
    private var outAnimation: Animation { .easeOut(duration: duration / 2) }
    private var fullAnimation: Animation { .easeInOut(duration: duration) }
    
    public init(pageContents: [PageContent]) {
        self.pageContents = pageContents
        
        if pageContents.indices.contains(0) {
            _backgroundColor = State(initialValue: pageContents[0].background)
        }
        
        if pageContents.indices.contains(1) {
            _circleColor = State(initialValue: pageContents[1].background)
        }
        
        if pageContents.count < 2 {
            print("Warning: Add more pages.")
        }
    }
    
    public var body: some View {
        mainContent
            .edgesIgnoringSafeArea(.vertical)
            .onChange(of: currentIndex) { _ in
                currentPageChanged()
            }
            .onAnimationCompleted(for: progress) {
                animationCompleted()
            }
    }
    
    // MARK: - Private
    
    private var mainContent: some View {
        ZStack {
            backgroundColor
            currentPages
            button
        }
    }
    
    private var shape: some View {
        AnimatableShape(progress: progress, radius: radius, limit: limit, direction: direction)
            .foregroundColor(circleColor)
    }
    
    private var button: some View {
        ZStack {
            shape
            Button(action: tapAction) {
                ZStack {
                    Circle()
                        .foregroundColor(isAnimated ? .clear : circleColor)
                        .frame(width: 2 * radius, height: 2 * radius)
                    nextImage
                }
            }
            .disabled(isAnimated)
        }
        .offset(y: 300)
    }
    
    private var nextImage: some View {
        Image(systemName: nextIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 10, height: 20)
            .foregroundColor(backgroundColor)
    }
    
    private var currentPages: some View {
        let maxXOffset: CGFloat = 600.0
        let maxYOffset: CGFloat = 40.0
        let coeff: CGFloat = direction == .forward ? -1 : 3
        
        return ZStack {
            if pageContents.count > 0 {
                pageContents[currentIndex].view
                    .scaleEffect(isAnimated ? 2 / 3 : 1)
                    .offset(x: isAnimated ? coeff * maxXOffset : 0,
                            y: isAnimated ? maxYOffset : 0)
                    .animation(isAnimated ? fullAnimation : .none)
            }
            
            if pageContents.count > 1 {
                pageContents[nextIndex].view
                    .scaleEffect(isAnimated ? 1 : 2 / 3)
                    .offset(x: isAnimated ? 0 : -coeff * maxXOffset,
                            y: isAnimated ? 0 : maxYOffset)
                    .animation(isAnimated ? fullAnimation : .none)
            }
        }
    }
    
    public func goToNextPage(animated: Bool = true) {
        if let block = insteadOfCyclingToFirstPage, currentIndex == pageContents.count - 1 {
            block()
        } else {
            animated ? goToNextPageAnimated() : goToNextPageUnanimated()
        }
    }
    
    public func goToPreviousPage(animated: Bool = true) {
        if let block = insteadOfCyclingToLastPage, currentIndex == 0 {
            block()
        } else {
            animated ? goToPrevPageAnimated() : goToPrevPageUnanimated()
        }
    }
    
    // MARK: -
    
    private func tapAction() {
        if let block = didPressNextButton {
            block()
        } else {
            goToNextPage(animated: true)
        }
    }
    
    private func currentPageChanged() {
        didChangeCurrentPage?(currentIndex)
        if currentIndex == pageContents.count - 1 {
            didGoToLastPage()
        }
    }
    
    private func animationCompleted() {
        if progress == limit {
            progress += 0.001
            withAnimation(outAnimation) { progress = 2 * limit }
            updateColors(forNextPage: true)
        } else if progress == 2 * limit {
            direction == .forward ? goToNextPageUnanimated() : goToPrevPageUnanimated()
            animationDidEnd()
        }
    }
    
    // MARK: - Next / Prev actions
    
    private func goToNextPageAnimated() {
        direction = .forward
        nextIndex = moveIndexForward(currentIndex)
        startAnimation()
    }
    
    private func goToNextPageUnanimated() {
        isAnimated = false
        direction = .forward
        currentIndex = moveIndexForward(currentIndex)
        nextIndex = moveIndexForward(currentIndex)
        progress = 0
    }
    
    private func goToPrevPageAnimated() {
        direction = .backward
        nextIndex = moveIndexBackward(currentIndex)
        startAnimation()
    }
    
    private func goToPrevPageUnanimated() {
        isAnimated = false
        direction = .backward
        currentIndex = moveIndexBackward(currentIndex)
        nextIndex = moveIndexBackward(currentIndex)
        progress = 0
    }
    
    private func startAnimation() {
        animationWillBegin()
        isAnimated = true
        updateColors()
        progress = 0
        withAnimation(inAnimation) { progress = limit }
    }
    
    private func updateColors(forNextPage: Bool = false) {
        backgroundColor = pageContents[forNextPage ? nextIndex : currentIndex].background
        circleColor = pageContents[forNextPage ? currentIndex : nextIndex].background
    }
    
    // MARK: - Helpers
    
    private func moveIndexForward(_ index: Int) -> Int {
        index + 1 < pageContents.count ? index + 1 : 0
    }
    
    private func moveIndexBackward(_ index: Int) -> Int {
        index - 1 >= 0 ? index - 1 : pageContents.count - 1
    }
}

// MARK: -

extension ConcentricOnboardingView {
    
    public func duration(_ timeInterval: Double) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.duration = timeInterval
        return concentricOnboardingView
    }
    
    public func nextIcon(_ iconName: String) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.nextIcon = iconName
        return concentricOnboardingView
    }
}

// MARK: - Closures

extension ConcentricOnboardingView {
    
    public func animationWillBegin(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.animationWillBegin = perform
        return concentricOnboardingView
    }
    
    public func animationDidEnd(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.animationDidEnd = perform
        return concentricOnboardingView
    }
    
    public func didGoToLastPage(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.didGoToLastPage = perform
        return concentricOnboardingView
    }
    
    // MARK: - Optional methods
    
    public func insteadOfCyclingToFirstPage(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.insteadOfCyclingToFirstPage = perform
        return concentricOnboardingView
    }
    
    public func insteadOfCyclingToLastPage(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.insteadOfCyclingToLastPage = perform
        return concentricOnboardingView
    }
    
    public func didPressNextButton(perform: @escaping () -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.didPressNextButton = perform
        return concentricOnboardingView
    }
    
    public func didChangeCurrentPage(perform: @escaping (Int) -> Void) -> ConcentricOnboardingView {
        var concentricOnboardingView = self
        concentricOnboardingView.didChangeCurrentPage = perform
        return concentricOnboardingView
    }
}
