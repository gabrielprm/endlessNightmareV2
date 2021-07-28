//
//  HomeScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit
import GameKit

class HomeScene: SKScene, GKGameCenterControllerDelegate {
    


    let haptich = HaptictsManager()
    var gameHomeSound = SKAudioNode(fileNamed: "homeSceneSound")
    var buttonMusic: SKSpriteNode!
    var gameCenter: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        buttonMusic = childNode(withName: "music") as? SKSpriteNode
        gameName = childNode(withName: "gameName") as? SKLabelNode
        buttonPlay = childNode(withName: "buttonPlay") as? SKSpriteNode
        buttonSettings = childNode(withName: "buttonSettings") as? SKSpriteNode
        gameCenter = childNode(withName: "gameCenter") as? SKSpriteNode
        
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
            
        } else if node == gameCenter {
            
            transition()
            
        } else {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameScene = SKScene(fileNamed: "GameScene")!

            gameScene.scaleMode = .aspectFill

            haptich.oneVibrationHaptic()

            view!.presentScene(gameScene, transition: transition)

        }
    }
    
    func transition() {
        let rootViewController = self.view?.window?.rootViewController
        let gameCenter = GKGameCenterViewController()
        gameCenter.gameCenterDelegate = self
        
        rootViewController?.present(gameCenter, animated: true, completion: nil)
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }

}
