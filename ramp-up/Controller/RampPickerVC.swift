//
//  RampPickerVC.swift
//  ramp-up
//
//  Created by Rick Pearce on 4/13/18.
//  Copyright © 2018 Pearce. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerVC: UIViewController {

    let SCN_ASSETS = "art.scnassets/"
    var sceneView: SCNView!
    var size: CGSize!
    weak var rampPlacerVC: RampPlacerVC!
    
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        
        preferredContentSize = size
        
        let scene = SCNScene(named: "\(SCN_ASSETS)ramps.scn")!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        
        var obj: SCNScene?
        var node: SCNNode?
        
        obj = SCNScene(named: "\(SCN_ASSETS)pipe.dae")
        node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0015, 0.0015, 0.0015)
        node?.position = SCNVector3Make(0, -0.4, 0)
        scene.rootNode.addChildNode(node!)

        

        obj = SCNScene(named: "\(SCN_ASSETS)pyramid.dae")
        node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -1.25, 0)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "\(SCN_ASSETS)quarter.dae")
        node = obj?.rootNode.childNode(withName: "quarter", recursively: true)!
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -2.5, 0)
        scene.rootNode.addChildNode(node!)
        
    }

    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        if hitResults.count > 0 {
            let node = hitResults[0].node
            print(node.name!)
            rampPlacerVC.onRampSelected(node.name!)
        }
    }
    

    

}
