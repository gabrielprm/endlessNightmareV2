//
//  GameScene.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import Foundation
import SpriteKit
import GameKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    static let instance = GameScene()

    var firstMap: SKSpriteNode! = nil
    var secondMap: SKSpriteNode! = nil
    var character: SKNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var pauseMenu: PauseMenu! = nil
    var scoreLabel: SKLabelNode! = nil
    var tick = 1.0
    var isPausing = false
    
    let difficultyMultiplier = DifficultyIncrement()
    let scoreInt = ScoreCalculator()
    let haptics = HapticsManager()

    let gameMusic = SKAudioNode(fileNamed: "gameSceneSound")
    
    var scoreDisplay: Int {
        return scoreInt.scoreCounter / 60
    }
    
    override func didMove(to view: SKView) {
        if UserDefaults.standard.stateMusic() {
            addChild(gameMusic)
        }
        
        buttonPause = childNode(withName: "pause") as? SKSpriteNode
        pauseMenu = childNode(withName: "pauseMenu") as? PauseMenu
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        
        firstMap = MapGenerator(zPosition: 1)
        addChild(firstMap)
        
        secondMap = MapGenerator(position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(secondMap)
        
        CharacterManager.rowPosition = 2
        
        character = CharacterGenerator()
        addChild(character)
        
        
        let enemyMasterNode = PreSetsEnemy.enemyMasterNode
        
        enemyMasterNode.removeAllChildren()
        enemyMasterNode.removeFromParent()
        
        addChild(enemyMasterNode)
        
        physicsWorld.contactDelegate = self
        
        let movMap = SKAction.customAction(withDuration: 1, actionBlock: { [self] node, elapsedTime in

            MapManager.updateMap(firstMap: firstMap, secondMap: secondMap, count: CGFloat(difficultyMultiplier.difficultyCounter))
        })
        
        let attPontos = SKAction.customAction(withDuration: 1, actionBlock: { [self] node, elapsedTime in
            
            difficultyMultiplier.speedProgression()
            
            scoreInt.scoreIncrement(counter: difficultyMultiplier.difficultyCounter)
            
            if let node = node as? SKLabelNode{
                node.text = "\(scoreDisplay)"
            }
        })
        
        self.run(SKAction.repeatForever(movMap))
        scoreLabel.run(SKAction.repeatForever(attPontos))
        
        setupGestures()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
//        guard let nodeName = node.name else { return }
        
        if node == buttonPause {
            pauseMenu.toggleVisibility()
            buttonPause.isHidden = true
            
            if gameMusic.parent != nil {
                gameMusic.run(SKAction.pause())
            }
            
            haptics.oneVibrationHaptic()
            
            isPausing = true
            buttonPause.isUserInteractionEnabled = true
        } else if node == pauseMenu.buttonPlay {
            pauseMenu.toggleVisibility()
            buttonPause.isHidden = false
            
            if gameMusic.parent != nil {
                gameMusic.run(SKAction.play())
            }
            
            haptics.oneVibrationHaptic()
            
            buttonPause.isUserInteractionEnabled = false
            isPausing = false
            isPaused = false
        } else if node == pauseMenu.buttonMusic {
            let defaults = UserDefaults.standard
            
            defaults.changeStateMusic()
            Music.changeTextureMusicPause(pauseMenu.buttonMusic)
            
            if defaults.stateMusic() {
                addChild(gameMusic)
            } else {
                gameMusic.removeFromParent()
            }
            
            haptics.oneVibrationHaptic()
        } else if node == pauseMenu.buttonHome {
            haptics.oneVibrationHaptic()
            
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameOverScene = SKScene(fileNamed: "HomeScene")!
            
            gameOverScene.scaleMode = .aspectFill
            view!.presentScene(gameOverScene, transition: transition)
        }
    }
    
//    func menuPause(){
//        if buttonPause != nil {
//            buttonPause.isHidden = true
//        }
//        pauseMenu.isHidden = false
//
//        if gameMusic.parent != nil {
//            gameMusic.run(SKAction.pause())
//        }
//
//        buttonPause.isUserInteractionEnabled = true
//        isPausing = true
//    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case .up, .left:
                    haptics.oneVibrationHaptic()
                    CharacterManager.moveUp(character)
                case .down, .right:
                    haptics.oneVibrationHaptic()
                    CharacterManager.moveDown(character)
                default:
                    break
            }
        }
    }
    
    func setupGestures() {
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        view!.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        view!.addGestureRecognizer(swipeDown)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        view!.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        view!.addGestureRecognizer(swipeLeft)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if gameMusic.parent != nil {
            gameMusic.run(SKAction.stop())
        }
        
        saveScore()
        
        haptics.twoVibrationHaptic(for: .success)
        
        let transition = SKTransition.fade(withDuration: 1.5)
        let gameOverScene = SKScene(fileNamed: "GameOverScene")!
        
        gameOverScene.scaleMode = .aspectFill
        
        view!.presentScene(gameOverScene, transition: transition)
        
        if #available(iOS 14.0, *) {
            points()
        } else {
            // Fallback on earlier versions
        }
    }
    
    @available(iOS 14.0, *)
    func points() {
        if GKLocalPlayer.local.isAuthenticated {
            GKLeaderboard.submitScore(scoreDisplay, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["ThePlan"], completionHandler: { _ in })
        }
    }
    
    func saveScore() {
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: "highScore") as Int? ?? 0
        
        if scoreDisplay > highScore {
            UserDefaults.standard.set(scoreDisplay, forKey: "highScore")
        }
        
        UserDefaults.standard.set(scoreDisplay, forKey: "score")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // spawn de inimigos
        if tick > 120 {
            EnemyManager.enemyBorn()
            tick = 0
        }
        
        if isPausing {
            self.isPaused = true
            return
        }
        
        switch scoreDisplay {
        case 500...750:
            tick = tick + (difficultyMultiplier.difficultyCounter * 0.6)
        case 750...1250:
            tick = tick + (difficultyMultiplier.difficultyCounter * 0.8)
        case 1250...100000:
            tick = tick + (difficultyMultiplier.difficultyCounter * 1.0)
        default:
            tick = tick + (difficultyMultiplier.difficultyCounter * 0.4)
        }
        
        EnemyManager.enemyDie(enemyMasterNode: PreSetsEnemy.enemyMasterNode)
        
        //E responsavel pela movimentacao dos inimigos
        EnemyManager.move(enemyMasterNode: PreSetsEnemy.enemyMasterNode, count: CGFloat(difficultyMultiplier.difficultyCounter))
    }
}
