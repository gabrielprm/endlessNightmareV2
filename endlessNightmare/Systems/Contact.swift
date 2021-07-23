//
//  Contact.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 22/07/21.
//

import SpriteKit

class Contact {
    
    let characterCategory: UInt32 = 1;
    let enemyCategory: UInt32 = 2;
    
//    let soldierCategory:UInt32 = 0x1 << 0;
//    let bulletCategory:UInt32 = 0x1 << 1;
    
}

enum ContactCategory: UInt32 {
    case character = 1
    case enemy = 2
    case bullet = 3
}
