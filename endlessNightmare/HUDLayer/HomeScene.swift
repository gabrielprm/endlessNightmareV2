//
//  HomeScene.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 19/07/21.
//

import SpriteKit
import GameKit

class HomeScene: SKScene, GKGameCenterControllerDelegate {
    
    var gameName: SKLabelNode! = nil
    var buttonPlay: SKSpriteNode! = nil
    var buttonSettings: SKSpriteNode! = nil
    var scoreLabel: SKLabelNode! = nil
    var rank: SKShapeNode! = nil
    
    override func didMove(to view: SKView) {
        
        rank = SKShapeNode(circleOfRadius: 30)
        rank.position = CGPoint(x: -200, y: -600)
        rank.zPosition = 15
        addChild(rank)
        
        gameName = childNode(withName: "gameName") as? SKLabelNode
        buttonPlay = childNode(withName: "buttonPlay") as? SKSpriteNode
        buttonSettings = childNode(withName: "buttonSettings") as? SKSpriteNode
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel.text = "High Score: \(UserDefaults.standard.integer(forKey: "highScore") as Int)"
        
        let gameSound: SKAudioNode = SKAudioNode(fileNamed: "homeSceneSound")
        addChild(gameSound)
        
        AssetsReference.instance.preloadAssetsBackground()
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
            
        }else if node == rank {
            transition()
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
