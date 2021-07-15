//
//  MapGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit
import GameplayKit

public class Map: SKNode{
    var mapa: SKSpriteNode! = nil
    
    init(imageName: String, position: CGPoint, zPosition: CGFloat){
        
        super.init()
        
        mapa = SKSpriteNode(texture: SKTexture(imageNamed: imageName))
        mapa.position = position
        mapa.zPosition = zPosition
    }
    
    init(imageName: String, zPosition: CGFloat){
        
        super.init()
        
        mapa = SKSpriteNode(texture: SKTexture(imageNamed: imageName))
        mapa.zPosition = zPosition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
