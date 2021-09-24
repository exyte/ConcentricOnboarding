//
//  ConcentricOnboardingView+Modifiers.swift
//  ConcentricOnboarding
//
//  Created by Daniil Manin on 20.09.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

fileprivate var disableHalfCompletion: Bool = false

struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {
    
    var animatableData: Value {
        didSet { notifyCompletion() }
    }
    
    private var targetValue: Value
    private var completion: () -> Void = { }
    private var halfCompletion: (() -> Void)?
    
    init(observedValue: Value, completion: @escaping () -> Void = { }) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }
    
    init(observedValue: Value, targetValue: Value, halfCompletion: @escaping () -> Void) {
        self.halfCompletion = halfCompletion
        self.animatableData = observedValue
        self.targetValue = targetValue
    }
    
    func body(content: Content) -> some View {
        return content
    }
    
    // MARK: - Private
    
    private func notifyCompletion() {
        notifyCompletionIfFinished()
        if halfCompletion != nil && !disableHalfCompletion {
            notifyHalfCompletionIfFinished()
        }
    }
    
    private func notifyCompletionIfFinished() {
        if animatableData == targetValue {
            DispatchQueue.main.async { completion() }
        }
    }
    
    private func notifyHalfCompletionIfFinished() {
        guard let animatableDataDouble = animatableData as? Double,
              let targetValueDouble = targetValue as? Double else { return }
        
        if animatableDataDouble.rounded() == targetValueDouble {
            disableHalfCompletion = true
            DispatchQueue.main.async {
                halfCompletion?()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                disableHalfCompletion = false
            }
        }
    }
}


extension View {
    
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
    
    func onAnimationHalfCompleted<Value: VectorArithmetic>(for value: Value, targetValue: Value, halfCompletion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, targetValue: targetValue, halfCompletion: halfCompletion))
    }
}
