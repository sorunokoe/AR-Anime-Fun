//
//  ViewController.swift
//  ARExperiment
//
//  Created by Salgara on 8/4/19.
//  Copyright © 2019 Salgara. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSKView!
    
    var images = ["koichi", "jojo", "vinland_father", "thorfin", "sakura"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        if let scene = MenuScene(fileNamed: "MenuScene"){
            sceneView.presentScene(scene)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }

}
extension ViewController: ARSKViewDelegate{
    
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        if let image = images.popLast(){
            let koichiNode = SKSpriteNode(imageNamed: image)
            koichiNode.xScale = 0.05
            koichiNode.yScale = 0.05
            node.addChild(koichiNode)
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
}
