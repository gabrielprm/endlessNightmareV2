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
    
//    func attScore(){
//        
//        let attPontos = SKAction.customAction(withDuration: 1, actionBlock: {
//            node, elapsedTime in
//            
//            //Funcao responsavel por aumenta a velocidade, e por consequencia a dificuldade
//            self.difficultyMultiplier.speedProgression()
//            
//            //Calculo progressivo da pontuacao
//            self.scoreInt.scoreIncrement(counter: self.difficultyMultiplier.difficultyCounter)
//            
//            if let node = node as? SKLabelNode{
//                
//                //Mostra a pontuacao na tela
//                //E dividido por 60, pois e a taxa de atualizacao do update
//                //score.text = "\(scoreInt.scoreCounter / 60)"
//                node.text = "\(self.scoreInt.scoreCounter / 30)"
//            }
//            
//        })
//    }

    
}

