//
//  GameSound.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 23/07/21.
//

import Foundation
import SpriteKit

class GameSound{
    enum SoundList{
        case homeSceneSound
        case gameOverSceneSound
        case gameSceneSound
    }
    
    init(gameSound: SoundList) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
