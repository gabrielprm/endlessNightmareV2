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
    var buttonSong: SKSpriteNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        fatalError("init() has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonPlay = childNode(withName: "buttonPlay") as? SKSpriteNode
        buttonHome = childNode(withName: "buttonHome") as? SKSpriteNode
        buttonSong = childNode(withName: "buttonSong") as? SKSpriteNode
        
        changeTextureSong()
        
        isHidden = true
    }
    
    func changeTextureSong() {
        let defaults = UserDefaults.standard
        let texture = SKTexture(imageNamed: defaults.stateSong() ? "button_songOn" : "button_songOff")
        
        buttonSong.texture = texture
    }
    
    func toggleVisibility() {
        isHidden = !isHidden
    }
    
}
