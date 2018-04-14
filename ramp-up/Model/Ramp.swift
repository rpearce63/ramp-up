//
//  Ramp.swift
//  ramp-up
//
//  Created by Rick on 4/13/18.
//  Copyright © 2018 Pearce. All rights reserved.
//

import Foundation
import SceneKit

class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode {
        switch rampName {
        case "pipe":
            return Ramp.getPipe()
            break
        case "pyramid":
            return Ramp.getPyramid()
            break
        case "quarter":
            return Ramp.getQuarter()
            break
        default:
            return Ramp.getPipe()
        }
    }
    
    class func getPipe() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pipe.dae")
        let node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.scale = SCNVector3Make(0.0015, 0.0015, 0.0015)
        node?.position = SCNVector3Make(0, -0.4, 0)
        return node!
    }
    
    class func getPyramid() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pyramid.dae")
        let node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -1.25, 0)
        return node!
    }
    
    class func getQuarter() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/quarter.dae")
        let node = obj?.rootNode.childNode(withName: "quarter", recursively: true)!
        node?.scale = SCNVector3Make(0.0045, 0.0045, 0.0045)
        node?.position = SCNVector3Make(0, -2.5, 0)
        return node!
    }
    
    class func startRotation(node: SCNNode) {
         let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
    
    
}
