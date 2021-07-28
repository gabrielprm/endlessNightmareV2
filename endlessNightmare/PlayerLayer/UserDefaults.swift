//
//  UserDefaults.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 26/07/21.
//

import Foundation

extension UserDefaults {
    
    func stateMusic() -> Bool {
        return self.object(forKey: "music") != nil ? self.bool(forKey: "music") : true
    }
    
    func changeStateMusic() {
        self.set(!self.stateMusic(), forKey: "music")
    }
    
}
