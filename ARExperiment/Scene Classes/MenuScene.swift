//
//  MenuScene.swift
//  ARExperiment
//
//  Created by Salgara on 8/4/19.
//  Copyright © 2019 Salgara. All rights reserved.
//

import ARKit
import SpriteKit

class MenuScene: SKScene{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let positionInScene = touch.location(in: self)
        let touchedNodes = self.nodes(at: positionInScene)
        if let name = touchedNodes.last?.name{
            if name == "StartGame"{
                let transition = SKTransition.crossFade(withDuration: 0.0)
                guard let sceneView = self.view as? ARSKView else { return }
                if let gameScene = SceneClass(fileNamed: "Sceneas"){
                    sceneView.presentScene(gameScene, transition: transition)
                    _ = SoundHelper.shared.play(theme: .main)
                }
            }
        }
        
        
    }
    
}
