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
    
    init(image: UIImage, fixedTall: CGFloat) {
        self.image = image
        self.fixedTall = fixedTall
    }

    func imagePixelPersize(humanJoints: [String: CGPoint]) -> CGFloat {
        guard let headHumanJoint = humanJoints["neck_1_joint"] else {return 0.0}
        guard let feetHumanJoint = humanJoints["left_foot_joint"] else {return 0.0}
        
        let humanTall = feetHumanJoint.y - headHumanJoint.y
        let realHumanTall = fixedTall / (humanTall * image.size.height)
        
        return realHumanTall
    }
}
