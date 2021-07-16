//
//  DifficultyIncrement.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

@propertyWrapper
private struct coefficientOfVelocityCalculator {
    private var coefficient = 0.0
    var wrappedValue: Double {
        get { return coefficient }
        set {
            coefficient += newValue
        }
    }
}

class DifficultyIncrement{
    
    var axysX:Double
    
    init(axysX:CGFloat) {
        self.axysX = Double(axysX)
    }

    @coefficientOfVelocityCalculator private var difficultyCounter:Double
    
    func speedProgression() -> Double{
        
        difficultyCounter = axysX
        
        return difficultyCounter
    }
    
}


