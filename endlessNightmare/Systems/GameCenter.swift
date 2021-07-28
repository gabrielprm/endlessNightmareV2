//
//  GameCenter.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 28/07/21.
//

import GameKit

class GameCenter: SKScene, GKGameCenterControllerDelegate{
    
    
    func autenticate(){
        let localPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = { view, Error in
            
            if view != nil{
                view?.present(view!, animated: true, completion: nil)
            }
        }
    }
    
    func transition() {
        let rootViewController = self.view?.window?.rootViewController
        let gameCenter = GKGameCenterViewController()
        gameCenter.gameCenterDelegate = self
        
        rootViewController?.present(gameCenter, animated: true, completion: nil)
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
}
