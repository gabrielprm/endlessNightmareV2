//
//  GameOverScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var buttonHome: SKSpriteNode! = nil
    var buttonReturn: SKSpriteNode! = nil
    var scoreLabel: SKLabelNode! = nil
    var highScoreLabel: SKLabelNode! = nil
    let gameMusic = SKAudioNode(fileNamed: "gameOverSceneSound")
    
    override func didMove(to view: SKView) {
        buttonHome = childNode(withName: "home") as? SKSpriteNode
        buttonReturn = childNode(withName: "return") as? SKSpriteNode
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel.text = "SCORE: \(UserDefaults.standard.integer(forKey: "score") as Int)"
        
        highScoreLabel = childNode(withName: "highScoreLabel") as? SKLabelNode
        highScoreLabel.text = "HIGH SCORE: \(UserDefaults.standard.integer(forKey: "highScore") as Int)"
        
        if UserDefaults.standard.stateMusic() {
            addChild(gameMusic)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        
        if node == buttonHome {
            let transition = SKTransition.fade(withDuration: 1.5)
            let homeScene = SKScene(fileNamed: "HomeScene")!
            
            homeScene.scaleMode = .aspectFill
            
            view!.presentScene(homeScene, transition: transition)
        } else if node == buttonReturn {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameScene = SKScene(fileNamed: "GameScene")!
            
            gameScene.scaleMode = .aspectFill
            
            view!.presentScene(gameScene, transition: transition)
        }
    }
    
}
