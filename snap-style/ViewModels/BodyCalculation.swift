//
//  BodyCalculation.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 08/07/23.
//

import SwiftUI

class BodyCalculation {
    let image : UIImage
    let fixedTall : CGFloat
    let secondImage: UIImage
    
    init(image: UIImage, fixedTall: CGFloat, secondImage: UIImage) {
        self.image = image
        self.fixedTall = fixedTall
        self.secondImage = secondImage
    }

    func imagePixelPersize(humanJoints: [String: CGPoint], isFront: Bool) -> CGFloat {
        guard let headHumanJoint = humanJoints["neck_1_joint"] else {return 0.0}
        guard let feetHumanJoint = humanJoints["left_foot_joint"] else {return 0.0}
        
        var realHumanTall = feetHumanJoint.y - headHumanJoint.y
        if isFront {
            realHumanTall = fixedTall / (realHumanTall * image.size.height)
        } else {
            realHumanTall = fixedTall / (realHumanTall * secondImage.size.height)
        }
        
        return realHumanTall
    }
    
    func bodyAroundCalculation(humanJoinstFront : [String : CGPoint], humanJoinstSide: [String: CGPoint]) -> [String: CGFloat] {
        var bodyAround : [String: CGFloat] = [:]
        
        let bodyPerPixelFront = imagePixelPersize(humanJoints: humanJoinstFront, isFront: true)
        let bodyPerPixelSide = imagePixelPersize(humanJoints: humanJoinstSide, isFront: false)
        
        bodyAround["shoulder"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "left_shoulder_1_joint", rightSide: "right_shoulder_1_joint")
        bodyAround["hip"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "left_upLeg_joint", rightSide: "right_upLeg_joint")
        print(humanJoinstSide["up_hip_left"])
        bodyAround["up_hip"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "up_hip_left", rightSide: "up_hip_right")
        bodyAround["bust"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "bust_left", rightSide: "bust_right")
        print(bodyAround)
    
        return bodyAround
    }
    
    private func aroundBody(humanJoinstFront : [String : CGPoint], humanJoinstSide: [String: CGPoint], bodyPerPixelFront: CGFloat, bodyPerPixelSide: CGFloat, leftSide: String, rightSide: String) -> CGFloat {
        let frontRange = BodyJoint().jointRange(firstJoint: humanJoinstFront[leftSide] ?? CGPoint(x: 0.0, y: 0.0), secondJoint: humanJoinstFront[rightSide] ?? CGPoint(x: 0.0, y: 0.0), sizePerPixel: bodyPerPixelFront, image: image)
        let sideRange = BodyJoint().jointRange(firstJoint: humanJoinstSide[leftSide] ?? CGPoint(x: 0.0, y: 0.0), secondJoint: humanJoinstSide[rightSide] ?? CGPoint(x: 0.0, y: 0.0), sizePerPixel: bodyPerPixelSide, image: secondImage)
        
        return elipseCalculation(bodyRangeSide: frontRange, bodyRangeFront: sideRange)
    }
    
    private func elipseCalculation(bodyRangeSide : CGFloat, bodyRangeFront: CGFloat) -> CGFloat {
        return (bodyRangeSide + bodyRangeFront) * 22 / 14
    }
}
