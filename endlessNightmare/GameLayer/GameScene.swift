//
//  GameScene.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background: SKSpriteNode!
    var character: SKNode! = nil
    var mapa: SKSpriteNode! = nil
    var mapa2: SKSpriteNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var score: SKLabelNode! = nil
    var masterNode = SKNode()
    let difficultyMultiplier = DifficultyIncrement()
    var i = 1.0
    var scoreInt = ScoreCalculator()
    var gameSound = SKAudioNode()
    let haptich = HaptictsManager()
    var lastSongIcon = SKSpriteNode(imageNamed: "songOn")
    
    
    override func didMove(to view: SKView) {
        lastSongIcon.name = "songOn"
        lastSongIcon.setScale(5)
        lastSongIcon.position = CGPoint(x: 250, y: 300)
        lastSongIcon.zPosition = 20
        
        gameSound = SKAudioNode(fileNamed: "gameSound")
        addChild(gameSound)
        
        background = childNode(withName: "background") as? SKSpriteNode
        
        buttonPause = childNode(withName: "buttonPause") as? SKSpriteNode
        
        score = childNode(withName: "score") as? SKLabelNode
        
        mapa = MapGenerator(imageName: "chao", zPosition: 1)
        addChild(mapa)
        
        mapa2 = MapGenerator(imageName: "chao", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(mapa2)
        
        CharacterManager.rowPosition = 2
        
        character = CharacterGenerator()
        addChild(character)
        
        let enemyMasterNode = PreSetsEnemy.enemyMasterNode
//
        enemyMasterNode.removeAllChildren()

        enemyMasterNode.removeFromParent()
        
        addChild(enemyMasterNode)
        
        physicsWorld.contactDelegate = self
        
        
        let movMap = SKAction.customAction(withDuration: 1, actionBlock: {
           node, elapsedTime in

            MapManager.updateMap(firstMap: self.mapa, secondMap: self.mapa2, count: CGFloat(self.difficultyMultiplier.difficultyCounter))
       })
        
        let attPontos = SKAction.customAction(withDuration: 1, actionBlock: {
            node, elapsedTime in
            
            self.difficultyMultiplier.speedProgression()
            
            self.scoreInt.scoreIncrement(counter: self.difficultyMultiplier.difficultyCounter)
            
            if let node = node as? SKLabelNode{
                node.text = "\(self.scoreInt.scoreCounter / 30)"
            }
            
            
        })
        self.run(SKAction.repeatForever(movMap))
        score.run(SKAction.repeatForever(attPontos))
        
        setupGestures()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        guard let nodeName = node.name else { return }
        
        if nodeName == "buttonPause" {
            let buttonPlay = SKSpriteNode(imageNamed: "button_play")
            buttonPlay.name = "buttonPlay"
            buttonPlay.zPosition = 999
            buttonPlay.setScale(4)
            
            addChild(buttonPlay)
            gameSound.run(SKAction.pause())
            node.isUserInteractionEnabled = true
            isPaused = true
            
            addChild(lastSongIcon)
        } else if nodeName == "buttonPlay" {
            node.removeFromParent()
            lastSongIcon.removeFromParent()
            if lastSongIcon.name == "songOn" {
                gameSound.run(SKAction.play())
            }
            buttonPause.isUserInteractionEnabled = false
            isPaused = false
        }
        
        if nodeName == "songOff" {
            lastSongIcon.removeFromParent()
            lastSongIcon.texture = SKTexture(imageNamed: "songOn")
            lastSongIcon.name = "songOn"
            addChild(lastSongIcon)
        } else if nodeName == "songOn" {
            lastSongIcon.removeFromParent()
            lastSongIcon.texture = SKTexture(imageNamed: "songOff")
            lastSongIcon.name = "songOff"
            gameSound.run(SKAction.pause())
            addChild(lastSongIcon)
        }
            
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
                case .up, .left:
                    haptich.oneVibrationHaptic()
                    CharacterManager.moveUp(character)
                case .down, .right:
                    haptich.oneVibrationHaptic()
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
        gameSound.run(SKAction.stop())
        
        saveScore()
        
        let transition = SKTransition.fade(withDuration: 1.5)
        let gameOverScene = SKScene(fileNamed: "GameOverScene")!
        
        haptich.twoVibrationHaptic(for: .success)
        gameOverScene.scaleMode = .aspectFill
        
        view!.presentScene(gameOverScene, transition: transition)
    }
    
    func saveScore() {
        let newScore = (scoreInt.scoreCounter / 30)
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: "highScore") as Int? ?? 0
        
        if(newScore > highScore){
            UserDefaults.standard.set(newScore, forKey: "highScore")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    // spawn de inimigos
    if i > 120{
        EnemyManager.enemyBorn()
        i = 0
    }
        i += difficultyMultiplier.difficultyCounter * 0.8
    EnemyManager.enemyDie(enemyMasterNode: PreSetsEnemy.enemyMasterNode)
    print(difficultyMultiplier.difficultyCounter)

        
    //E responsavel pela movimentacao dos inimigos
    EnemyManager.move(enemyMasterNode: PreSetsEnemy.enemyMasterNode, count: CGFloat(difficultyMultiplier.difficultyCounter))
    }
}
