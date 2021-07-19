//
//  DifficultyIncrement.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

@propertyWrapper
private struct CoefficientOfVelocityCalculator {
    private var coefficient = 0.0
    var wrappedValue: Double {
        get { return coefficient }
        set {
            coefficient = log(newValue)
        }
    }
}

class DifficultyIncrement {
    var axysX: Double = 0

    @CoefficientOfVelocityCalculator private var difficultyCounter: Double
    
    func speedProgression() -> Double {
        
        difficultyCounter = axysX
        axysX += 1
        
        return difficultyCounter
    }
}
