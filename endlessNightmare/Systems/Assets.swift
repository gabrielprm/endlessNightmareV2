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
            backgrounds.append(sprites.textureNamed("FundoTeste1"))
            backgrounds.append(sprites.textureNamed("FundoTeste2"))
            backgrounds.append(sprites.textureNamed("FundoTeste3"))
            backgrounds.append(sprites.textureNamed("FundoTeste4"))
            
            print("Loaded background textures!!!")
        }
    }
    
}
