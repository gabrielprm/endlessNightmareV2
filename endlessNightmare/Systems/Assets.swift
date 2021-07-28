//
//  AssetsReference.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 27/07/21.
//

import SpriteKit

class AssetsReference {
    
    static let instance = AssetsReference()
    
    let sprites = SKTextureAtlas(named: "Backgrounds")
    var backgrounds: [SKTexture] = []
    
    func preloadAssetsBackground() {
        sprites.preload { [self] in
            for i in 1...4 {
                backgrounds.append(sprites.textureNamed("Background0\(i)"))
            }
            
            print("Loaded background textures!!!")
        }
    }
    
}
