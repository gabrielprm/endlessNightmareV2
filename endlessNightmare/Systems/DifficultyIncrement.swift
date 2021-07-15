//
//  DifficultyIncrement.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit


class DifficultyIncrement{
    
    @propertyWrapper
    private struct coefficientOfVelocityCalculator {
        private var coefficient = 0.0
        var wrappedValue: Double {
            get { return coefficient }
            set {
                coefficient = newValue * (log2(newValue) / 2)
            }
        }
    }
    
    @coefficientOfVelocityCalculator private var difficultyCounter:Double
    
    func speedProgression(xMap:CGFloat) -> Double{
        
        let x = Double(xMap)
        difficultyCounter = x
        
        return difficultyCounter
    }
    
}
