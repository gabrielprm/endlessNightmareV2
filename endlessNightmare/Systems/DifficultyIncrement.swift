//
//  DifficultyIncrement.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

@propertyWrapper
struct CoefficientOfVelocityCalculator {
    private var coefficient = 0.0
    var wrappedValue: Double {
        get { return coefficient }
        set {
            coefficient = log(newValue) * -Double(MapData.movXCoefficient) * 1.1
        }
    }
}

class DifficultyIncrement {
    var axysX: Double = 1

    @CoefficientOfVelocityCalculator var difficultyCounter: Double
    
    func speedProgression(){

        difficultyCounter = axysX
        axysX += 0.1

    }
}
