//
//  HomeScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit

class HomeScene: SKScene {
    
    var gameHomeSound = SKAudioNode(fileNamed: "homeSceneSound")
    var buttonMusic: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        buttonMusic = childNode(withName: "music") as? SKSpriteNode
        
        Music.changeTextureMusic(buttonMusic)
        
        if UserDefaults.standard.stateMusic() {
            addChild(gameHomeSound)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        
        if node == buttonMusic {
            let defaults = UserDefaults.standard
            
            defaults.changeStateMusic()
            Music.changeTextureMusic(buttonMusic)
            
            if defaults.stateMusic() {
                addChild(gameHomeSound)
            } else {
                gameHomeSound.removeFromParent()
            }
        } else {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameScene = SKScene(fileNamed: "GameScene")!

            gameScene.scaleMode = .aspectFill

            view!.presentScene(gameScene, transition: transition)
        }
    }
    
}
