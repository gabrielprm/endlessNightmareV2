//
//  MapGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit
import GameplayKit

public class MapGenerator: SKSpriteNode{

//    let initialXPosition:CGFloat = 1310
//    let initialYPosition:CGFloat = 755
//    let movXCoefficient: CGFloat = -1
//    let movYCoefficient: CGFloat = -0.5773502691896257
    
    init(imageName: String, position: CGPoint, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: .clear, size: texture.size())

        self.position = position
        self.zPosition = zPosition
    }
    
    convenience init(imageName: String, zPosition: CGFloat) {
        self.init(imageName: imageName, position: CGPoint(x: 0, y: 0), zPosition: zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func updateMap(map: SKSpriteNode){
//        run(SKAction.moveBy(x: movXCoefficient, y: movYCoefficient, duration: 0.1))
//
//        if (position.x < -1310) {
//            position = map2.position
//            map.position = CGPoint(x: initialXPosition, y: initialYPosition)
//        }
//
//        map.run(SKAction.moveBy(x: movXCoefficient, y: movYCoefficient, duration: 0.1))
//    }
    
}
