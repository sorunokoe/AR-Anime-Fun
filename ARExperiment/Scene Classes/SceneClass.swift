//
//  SceneClass.swift
//  ARExperiment
//
//  Created by Salgara on 8/4/19.
//  Copyright © 2019 Salgara. All rights reserved.
//

import ARKit
import SpriteKit

class SceneClass: SKScene{
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else { return }
        if let touchLocation = touches.first?.location(in: sceneView){
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first{
                sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
            }
        }
    }
    
}
