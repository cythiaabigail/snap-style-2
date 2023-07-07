//
//  BodyJoint.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import Vision
import SwiftUI

class BodyJoint {
    var jointCoordinates : [CGPoint] = []
    
    func detectJoin(image: UIImage) -> [CGPoint] {
        guard let ciImage = CIImage(image: image) else {
            return jointCoordinates
        }
        
        let request = VNDetectHumanBodyPoseRequest { request, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let results = request.results as? [VNHumanBodyPoseObservation] {
                // Process the detected joints
                for result in results {
                    
                    guard let recognizedPoints = try? result.recognizedPoints(forGroupKey: .all) else {
                        continue
                    }
                    
                    for (jointName, point) in recognizedPoints {
                        print("\(jointName.rawValue)")
                        let coordinate = point.location
                        print(jointName.rawValue)
                        if (jointName.rawValue == "left_shoulder_1_joint" || jointName.rawValue == "right_shoulder_1_joint" || jointName.rawValue == "left_upLeg_joint" || jointName.rawValue == "right_upLeg_joint") {
                            self.jointCoordinates.append(coordinate)
                        }
                    }
                }
            } else {
                print("Unable to detect human body pose.")
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        do {
            try handler.perform([request])
        } catch {
            print("Error: \(error)")
        }
        
        return jointCoordinates
    }
    
    func getAnotherJoint() {
    }
}
