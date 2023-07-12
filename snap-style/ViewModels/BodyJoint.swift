//
//  BodyJoint.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import Vision
import SwiftUI

class BodyJoint {

    func detectJoin(image: UIImage) -> [String: CGPoint] {
        
        var jointCoordinates: [String: CGPoint] = [:]
        
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
                        var coordinate = point.location
                        if (jointName.rawValue == "left_shoulder_1_joint" || jointName.rawValue == "right_shoulder_1_joint" || jointName.rawValue == "left_upLeg_joint" || jointName.rawValue == "right_upLeg_joint" || jointName.rawValue == "left_foot_joint" || jointName.rawValue == "neck_1_joint") {
                            coordinate.x = coordinate.x * image.size.width
                            coordinate.y = (1-coordinate.y) * image.size.height
                            jointCoordinates[jointName.rawValue] = coordinate
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
    
    private func createNewJoint(humanJoints: [String: CGPoint]) {
        
    }
    
    func configJoint(humanJoints : [String: CGPoint], image: UIImage) -> [String: CGPoint] {
        var humanJointsConfigured : [String: CGPoint] = [:]
        
        for humanJoint in humanJoints {
//            print("\(humanJoint.key)")
            if humanJoint.key == "left_upLeg_joint" {
                //testing purpose
                var testJoint = jointToVerticalConfiguration(humanJoint: humanJoint.value, image: image, isLeft: true)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
//                humanJointsConfigured[humanJoint.key] = jointToLeft(humanJoint: humanJoint.value, image: image)
            } else if humanJoint.key == "right_upLeg_joint" {
                //testing purpose
                var testJoint = jointToVerticalConfiguration(humanJoint: humanJoint.value, image: image, isLeft: false)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
//                humanJointsConfigured[humanJoint.key] = jointToLeft(humanJoint: humanJoint.value, image: image)
            } else if humanJoint.key == "left_shoulder_1_joint" {
                //testing purpose
                var testJoint = jointToVerticalConfiguration(humanJoint: humanJoint.value, image: image, isLeft: true)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
//                humanJointsConfigured[humanJoint.key] = jointToLeft(humanJoint: humanJoint.value, image: image)
            } else if humanJoint.key == "right_shoulder_1_joint" {
                //testing purpose
                var testJoint = jointToVerticalConfiguration(humanJoint: humanJoint.value, image: image, isLeft: false)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
//                humanJointsConfigured[humanJoint.key] = jointToLeft(humanJoint: humanJoint.value, image: image)
            } else if humanJoint.key == "neck_1_joint" {
                var testJoint = jointToHorizontalConfiguration(humanJoint: humanJoint.value, image: image, isUp: true)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
            }
            else if humanJoint.key == "left_foot_joint" {
                var testJoint = jointToHorizontalConfiguration(humanJoint: humanJoint.value, image: image, isUp: false)
                testJoint.x = testJoint.x/image.size.width
                testJoint.y = testJoint.y/image.size.height
                humanJointsConfigured[humanJoint.key] = testJoint
            }
        }
        
        return humanJointsConfigured
    }
    
    private func jointToVerticalConfiguration(humanJoint : CGPoint, image: UIImage, isLeft: Bool) -> CGPoint {
        var cgPointWhite : CGPoint = humanJoint

        while image.isColorWhite(at: cgPointWhite) {
            cgPointWhite.x = cgPointWhite.x + (isLeft ? -50 : 50)
        }

        return cgPointWhite
    }


    private func jointToHorizontalConfiguration(humanJoint : CGPoint, image: UIImage, isUp : Bool) -> CGPoint {
        var cgPointWhite : CGPoint = humanJoint

        while image.isColorWhite(at: cgPointWhite) {
            cgPointWhite.y = cgPointWhite.y + (isUp ? -50 : 50)
        }

        return cgPointWhite
    }
    
    func jointRange(firstJoint: CGPoint, secondJoint: CGPoint, sizePerPixel: CGFloat, image: UIImage) -> CGFloat {
        var jaraks = 0.0
        var firstPoint = firstJoint
        var secondPoint = secondJoint
        firstPoint.x = firstPoint.x * image.size.width
        firstPoint.y = firstPoint.y * image.size.height
        secondPoint.x = secondPoint.x * image.size.width
        secondPoint.y = secondPoint.y * image.size.height
        
        let rangeX = abs(firstPoint.x-secondPoint.x)
        if firstJoint.y != secondJoint.y {
            let rangeY = abs(firstPoint.y-secondPoint.y)
            let jarak = (pow(rangeX, 2)) + (pow(rangeY, 2))
            jaraks = sqrt(jarak)
        } else {
            jaraks = rangeX
        }
        return jaraks * sizePerPixel
    }
    
    func bodyJointFromPercentage(jointName : String, jointPercentage: CGFloat, humanJoints: [String: CGPoint], image: UIImage) -> [String: CGPoint] {
        var joints = humanJoints
        
        let headY = (joints["neck_1_joint"]?.y ?? 0.0)
        let footY = (joints["left_foot_joint"]?.y ?? 0.0)
        var joint = joints["neck_1_joint"] ?? CGPoint(x: 0.0, y: 0.0)
        
        let valueY = abs((footY - headY)) * (1-jointPercentage)
        joint.y = headY + valueY
        joint.y = joint.y * image.size.height
        joint.x = joint.x * image.size.width
        
        var leftJoint = jointToVerticalConfiguration(humanJoint: joint, image: image, isLeft: true)
        var rightJoint = jointToVerticalConfiguration(humanJoint: joint, image: image, isLeft: false)
        leftJoint.x = leftJoint.x / image.size.width
        leftJoint.y = leftJoint.y / image.size.height
        rightJoint.x = rightJoint.x / image.size.width
        rightJoint.y = rightJoint.y / image.size.height
        
        joints[jointName + "_left"] = leftJoint
        joints[jointName + "_right"] = rightJoint
        
        return joints
    }
}
