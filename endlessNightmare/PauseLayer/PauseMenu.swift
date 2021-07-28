//
//  PauseMenu.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class PauseMenu: SKSpriteNode {
    
    var buttonPlay: SKSpriteNode!
    var buttonHome: SKSpriteNode!
    var buttonMusic: SKSpriteNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        fatalError("init() has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonPlay = childNode(withName: "play") as? SKSpriteNode
        buttonHome = childNode(withName: "home") as? SKSpriteNode
        buttonMusic = childNode(withName: "music") as? SKSpriteNode
        
        Music.changeTextureMusicPause(buttonMusic)
        
        isHidden = true
    }
    
    func toggleVisibility() {
        isHidden = !isHidden
    }
    
}
