//
//  Score.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

@propertyWrapper
struct TotalScore {
    private var score = 0
    var wrappedValue: Int {
        get { return score }
        set {
            score += 1 * newValue
        }
    }
}

class ScoreCalculator {
    
    @TotalScore var scoreCounter:Int
    
    func scoreIncrement(counter: Double) {
        scoreCounter = Int(counter)
    }
    
}

