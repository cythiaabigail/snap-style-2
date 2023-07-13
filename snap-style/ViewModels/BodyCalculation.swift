//
//  BodyCalculation.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 08/07/23.
//

import SwiftUI


class BodyCalculation {
    @AppStorage("gender") var appGender: String = ""
    @AppStorage("appBodyShape") var appBodyShape: String = ""
    
    let image : UIImage
    let fixedTall : CGFloat
    let secondImage: UIImage
    
    init(image: UIImage, fixedTall: CGFloat, secondImage: UIImage) {
        self.image = image
        self.fixedTall = fixedTall
        self.secondImage = secondImage
    }
    
    func imagePixelPersize(humanJoints: [String: CGPoint], isFront: Bool) -> CGFloat {
        guard let headHumanJoint = humanJoints["neck_1_joint"] else { return 0.0 }
        guard let feetHumanJoint = humanJoints["left_foot_joint"] else { return 0.0 }
        
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
        
        var bodyShape : String = ""
        
        let bodyPerPixelFront = imagePixelPersize(humanJoints: humanJoinstFront, isFront: true)
        let bodyPerPixelSide = imagePixelPersize(humanJoints: humanJoinstSide, isFront: false)
        
        bodyAround["shoulder"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "left_shoulder_1_joint", rightSide: "right_shoulder_1_joint")
        bodyAround["hip"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "left_upLeg_joint", rightSide: "right_upLeg_joint")
        //        print(humanJoinstSide["up_hip_left"])
        bodyAround["up_hip"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "up_hip_left", rightSide: "up_hip_right")
        bodyAround["bust"] = aroundBody(humanJoinstFront: humanJoinstFront, humanJoinstSide: humanJoinstSide, bodyPerPixelFront: bodyPerPixelFront, bodyPerPixelSide: bodyPerPixelSide, leftSide: "bust_left", rightSide: "bust_right")
        
        bodyShape = bodyShapeResult(fourData: bodyAround, marginError: 0.05)
        
        appBodyShape = bodyShapeResult(fourData: bodyAround, marginError: 0.05)
        
        print(bodyAround)
        print(bodyShape)
        print(appBodyShape)
        
        
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
    
    func bodyShapeResult(fourData : [String: CGFloat], marginError : CGFloat) -> String{
        
        //data chytia || rectangle
//        let shoulder = 103.0
//                        let hip = 92.0
//        let waist = 107.0
//                        let bust = 83.0
        
        // data hourglass
//                        let shoulder = 89.5
//                        let hip = 90.0
//                        let waist = 79.0
//                        let bust = 90.0
        
        //data inv triangle
//                let shoulder = 100.0
//                let hip = 80.0
//                let waist = 69.0
//                let bust = 90.0
        
        //data apple
                let shoulder = fourData["shoulder"]!
                let hip = fourData["hip"]!
                let waist = fourData["up_hip"]!
                let bust = fourData["bust"]!
        
        //data pear
//        let shoulder = 89.5
//        let hip = 100.0
//        let waist = 90.0
//        let bust = 90.0
        
        
        
        let rangeShoulderDown = shoulder - (marginError * shoulder)
        let rangeShoulderUp = shoulder + (marginError * shoulder)
        
        let rangeShoulderDownTenPercent = shoulder - (0.1 * shoulder)
        let rangeShoulderUpTenPercent = shoulder + (0.1 * shoulder)
        
        let rangeHipDown = hip - (marginError * hip)
        let rangeHipUp = hip + (marginError * hip)
        
        let rangeWaistDown = waist - (marginError * waist)
        let rangeWaistUp = waist + (marginError * waist)
        
        let rangeBustDown = bust - (marginError * bust)
        let rangeBustUp = bust + (marginError * bust)
        
        let gender =  appGender
        
        var hasil = "Rectangle"
        //        print(rangeShoulderDown)
        //        print(rangeShoulderUp)
        //        print(rangeHipDown)
        //        print(rangeHipUp)
        //        print(rangeWaistDown)
        //        print(rangeWaistUp)
//        print(rangeBustDown)
//        print(rangeBustUp)
        
        //FEMALE
        if(gender == "female"){
            //Rectangle,
            //Shoulder dan Hips memiliki ukuran yang hampir sama
            //Bust lebih kecil dari shoulder/hips
            //Waist lebar paling kecil, tapi perbandingan dari bust, gaboleh lebih kecil sampe 20cm
            if(hip >= rangeShoulderDown && hip <= rangeShoulderUp)
            {
                if(bust <= shoulder || bust <= hip){
                    if(waist <= bust && bust - waist < 20.0){
                        hasil = "Rectangle"
                        
                    }
                }
            }
            
            
            //HourGlass,
            //Bust and Hips memiliki ukuran hampir sama
            //Waist kecil banget, harus lebih dari 20cm perbedaannya
            if(hip >= rangeBustDown && hip <= rangeBustUp)
            {
                if(waist < hip && hip - waist >= 10.0){
                    hasil = "Hourglass"
                }
            }
            
            //Inverted Triangle
            //Shoulder paling lebar
            //Bust mengecil
            //Hips mengecil
            if(shoulder>hip && shoulder>bust && shoulder>waist){
                if(bust > hip && bust > waist){
                    hasil = "Inverted Triangle"
                    
                }
            }
            
            //Apple,
            //Bust paling besar
            //hips lebih kecil
            if(bust > rangeHipUp && bust > rangeWaistUp && bust > rangeShoulderUp){
                hasil = "Apple"
            }
            
            //Pear
            //Hips paling besar
            if(hip > rangeBustUp && hip > rangeWaistUp && hip > rangeShoulderUp){
                hasil = "Pear"
            }
        }
        else if(gender == "male"){
            //Rectangle
            //shoulder, waist, hips mirip2
            if(hip >= rangeShoulderDown && hip <= rangeShoulderUp)
            {
                if(bust <= shoulder || bust <= hip){
                    if(waist <= bust && bust - waist < 20.0){
                        hasil = "Rectangle"
                        
                    }
                }
            }
            if(waist > bust && waist > shoulder && waist > hip){
                if(shoulder >= rangeWaistDown && shoulder <= rangeWaistUp){
                    hasil = "Oval"
                }else
                {
                    hasil = "Triangle"
                }
            }
            if(shoulder > rangeHipUp && shoulder > rangeWaistUp && shoulder > rangeBustUp){
                if(rangeShoulderDownTenPercent >= hip && rangeShoulderDown >= waist){
                    hasil = "Inverted Triangle"
                }else{
                    hasil = "Trapezoid"
                }
            }
            
        }
        
        
        
        
        
        
        
        
        
        
        //COWOK
        //Rectangle
        //shoulder, waist, hips mirip
        
        //Oval
        //Shoulder & hips lebih kecil dibanding waist
        
        //triangle
        //shoulder paling kecil
        
        //invert triangle
        //Shoulder paling lebar
        //waist dan hip mirip2
        
        //trapezoid
        //shoulder paling lebar
        //waist dan hip mirip2 sama shoulder
        
        return hasil
    }
}
