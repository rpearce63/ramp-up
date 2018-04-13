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
        
        var obj: SCNScene?
        var node: SCNNode?
        
        obj = SCNScene(named: "\(SCN_ASSETS)pipe.dae")
        node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!

        node?.scale = SCNVector3Make(0.0015, 0.0015, 0.0015)
        node?.position = SCNVector3Make(0, -0.4, 0)
        scene.rootNode.addChildNode(node!)

        

        obj = SCNScene(named: "\(SCN_ASSETS)pyramid.dae")
        node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -1.25, 0)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "\(SCN_ASSETS)quarter.dae")
        node = obj?.rootNode.childNode(withName: "quarter", recursively: true)!
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -2.5, 0)
        scene.rootNode.addChildNode(node!)
        
    }

    
    

    

}
