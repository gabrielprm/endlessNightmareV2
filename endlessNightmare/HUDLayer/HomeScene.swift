//
//  HomeScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit

class HomeScene: SKScene {
    
    var gameName: SKLabelNode! = nil
    var buttonPlay: SKSpriteNode! = nil
    var buttonSettings: SKSpriteNode! = nil
    var scoreLabel: SKLabelNode! = nil
    
    override func didMove(to view: SKView) {
        gameName = childNode(withName: "gameName") as? SKLabelNode
        buttonPlay = childNode(withName: "buttonPlay") as? SKSpriteNode
        buttonSettings = childNode(withName: "buttonSettings") as? SKSpriteNode
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel.text = "High Score: \(UserDefaults.standard.integer(forKey: "highScore") as Int)"
        let gameSound: SKAudioNode = SKAudioNode(fileNamed: "homeSceneSound")
        addChild(gameSound)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        
        if node == buttonPlay {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameScene = SKScene(fileNamed: "GameScene")!
            
            gameScene.scaleMode = .aspectFill
            
            view!.presentScene(gameScene, transition: transition)
        } else if node == buttonSettings {
            
        }
    }
    
}
