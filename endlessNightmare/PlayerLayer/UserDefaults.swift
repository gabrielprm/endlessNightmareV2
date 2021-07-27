//
//  UserDefaults.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 26/07/21.
//

import Foundation

extension UserDefaults {
    
    func stateSong() -> Bool {
        return self.object(forKey: "song") != nil ? self.bool(forKey: "song") : true
    }
    
    func changeStateSong() {
        self.set(!self.stateSong(), forKey: "song")
    }
    
}
