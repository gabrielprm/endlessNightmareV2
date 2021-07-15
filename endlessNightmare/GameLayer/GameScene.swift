//
//  GameScene.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        let mapa = MapGenerator(imageName: "chao", zPosition: 1)
        addChild(mapa)
        
        let mapa2 = MapGenerator(imageName: "chao", position: CGPoint(x: 1310, y: 755), zPosition: 0)
        addChild(mapa2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func update(_ currentTime: TimeInterval) {
    
    }
}
