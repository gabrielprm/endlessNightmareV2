//
//  GameViewController.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import UIKit
import SpriteKit
import GameKit
import CoreHaptics

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        autenticate()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "HomeScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            AssetsReference.instance.preloadAssetsBackground()

        }
    }
    
    func autenticate(){
        let localPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {view, erro in
            if view != nil{
                self.present(view!, animated: true, completion: nil)
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
