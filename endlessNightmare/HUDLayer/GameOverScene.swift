//
//  GameOverScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var phrase: SKLabelNode! = nil
    var buttonHome: SKSpriteNode! = nil
    var buttonReplay: SKSpriteNode! = nil
    var scoreLabel: SKLabelNode! = nil
    
    override func didMove(to view: SKView) {
        phrase = childNode(withName: "phrase") as? SKLabelNode
        buttonHome = childNode(withName: "buttonHome") as? SKSpriteNode
        buttonReplay = childNode(withName: "buttonReplay") as? SKSpriteNode
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel.text = "High Score: \(UserDefaults.standard.integer(forKey: "highScore") as Int)"
        let gameSound: SKAudioNode = SKAudioNode(fileNamed: "gameOverSceneSound")
        addChild(gameSound)
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
        } else if node == buttonReplay {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameScene = SKScene(fileNamed: "GameScene")!
            
            gameScene.scaleMode = .aspectFill
            
            view!.presentScene(gameScene, transition: transition)
        }
    }
    
}
