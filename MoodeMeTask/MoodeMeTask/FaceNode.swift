//
//  FaceNode.swift
//  MoodeMeTask
//
//  Created by Isaac Shoma on 2023-05-21.
//

import SceneKit

class FaceNode: SCNNode {
    
    var options: [String]
    var index = 0
    
    init(with options: [String], width: CGFloat = 0.10, height: CGFloat = 0.10) {
        self.options = options
        
        super.init()
        
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial?.diffuse.contents =  UIImage(named: options.first!)
        plane.firstMaterial?.isDoubleSided = true
        
        geometry = plane
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Custom functions

extension FaceNode {
    
    func updatePosition(for vectors: [vector_float3]) {
        let newPos = vectors.reduce(vector_float3(), +) / Float(vectors.count)
        let yOffset: Float = -0.01 // Adjust this value to position the feature relative to the nose
        
        // Update the y-coordinate of the position to move the feature to the lower lip
        position = SCNVector3(newPos.x, newPos.y + yOffset, newPos.z)
    }
    
    func next() {
        index = (index + 1) % options.count
        
        if let plane = geometry as? SCNPlane {
            plane.firstMaterial?.diffuse.contents = UIImage(named: options[index])
            plane.firstMaterial?.isDoubleSided = true
        }
    }
}

