//
//  Music.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 28/07/21.
//

import SpriteKit

class Music {
    
    static func changeTextureMusic(_ node: SKSpriteNode) {
        let defaults = UserDefaults.standard
        let texture = SKTexture(imageNamed: defaults.stateMusic() ? "MusicOn" : "MusicOff")
        
        node.texture = texture
    }
    
    static func changeTextureMusicPause(_ node: SKSpriteNode) {
        let defaults = UserDefaults.standard
        let texture = SKTexture(imageNamed: defaults.stateMusic() ? "PauseMusicOn" : "PauseMusicOff")
        
        node.texture = texture
    }
}
