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
    
    var chao = SKSpriteNode()
    var chao2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        let mapa = Map(imageName: "chao", zPosition: 0)
        addChild(mapa.mapa)
        
//        chao2 = SKSpriteNode(texture: SKTexture( imageNamed: "chao"))
//        chao2.zPosition = -1
//        chao2.position.x = 1310
//        chao2.position.y = 755
//        chao2.position.x = 1310
//        chao2.position.y = 765

//            }
//        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    //var flag = true
    
    override func update(_ currentTime: TimeInterval) {
//        chao.run(SKAction.moveBy(x: -15, y: -0.57735026918962575, duration: 0.1))
//        let distancia = CGPoint(x: chao.position.x - chao2.position.x, y: chao.position.y - chao2.position.y)
//        let comprimeto = sqrt(Double(distancia.x * distancia.x + distancia.y * distancia.y))
//        if comprimeto > 1500 && flag{
//            addChild(chao2)
//            flag = false
//        }
//
//        if chao.position.x < -1310{
//            chao.position = chao2.position
//            chao2.position.x = 1310
//            chao2.position.y = 755
//        }
//
//        chao2.run(SKAction.moveBy(x: -15, y: -0.57735026918962575, duration: 0.1))
    }
}
