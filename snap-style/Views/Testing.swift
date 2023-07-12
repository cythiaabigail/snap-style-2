//
//  Testing.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

struct Testing: View {
    
    var imageView : UIImage = UIImage(named: "Front")!
    var imageSecond : UIImage = UIImage(named: "Side")!
    @State var realPoint : CGPoint = .zero
    
    var humanJoints : [String: CGPoint] = [:]
    var humanJoinstSide : [String: CGPoint] = [:]
    var correctedJoints : [String: CGPoint] = [:]
    
    let scanningBody : ScanningBody = ScanningBody()
    
    init() {
        humanJoints = BodyJoint().detectJoin(image: imageView)
        imageView = scanningBody.PersonSegmentation(imageView: imageView)
        humanJoints = BodyJoint().configJoint(humanJoints: humanJoints, image: imageView)
        humanJoints = BodyJoint().bodyJointFromPercentage(jointName: "up_hip", jointPercentage: 0.59, humanJoints: humanJoints, image: imageView)
        humanJoints = BodyJoint().bodyJointFromPercentage(jointName: "bust", jointPercentage: 0.7, humanJoints: humanJoints, image: imageView)
        
        humanJoinstSide = BodyJoint().detectJoin(image: imageSecond)
        imageSecond = scanningBody.PersonSegmentation(imageView: imageSecond)
        humanJoinstSide = BodyJoint().configJoint(humanJoints: humanJoinstSide, image: imageSecond)
        humanJoinstSide = BodyJoint().bodyJointFromPercentage(jointName: "up_hip", jointPercentage: 0.59, humanJoints: humanJoinstSide, image: imageSecond)
        humanJoinstSide = BodyJoint().bodyJointFromPercentage(jointName: "bust", jointPercentage: 0.7, humanJoints: humanJoinstSide, image: imageSecond)
        
        let bodyCalculation = BodyCalculation.init(image: imageView, fixedTall: 165, secondImage: imageSecond)
        bodyCalculation.bodyAroundCalculation(humanJoinstFront: humanJoints, humanJoinstSide: humanJoinstSide)
    }
    
    var body: some View {
        GeometryReader { viewSize in
            Image(uiImage: imageView)
                .resizable()
                .overlay {
                    PointOverlay(imageWidth: viewSize.size.width, imageHeight: viewSize.size.height, coordinates: self.humanJoints)
                }
        }
    }
    
    struct Testing_Previews: PreviewProvider {
        static var previews: some View {
            Testing()
        }
    }
    
    struct PointOverlay: View {
        
        var imageWidth: Double
        var imageHeight : Double
        var coordinates: [String: CGPoint]
        
        var body: some View {
            GeometryReader { geometry in
                ForEach(0..<coordinates.count) { indexCoordinate in
                    
                    let jointName: String = coordinates.keys[coordinates.index(coordinates.startIndex, offsetBy: indexCoordinate)]
                    let coordinate: CGPoint? = coordinates[jointName]
                    
                    let x = (coordinate!.x) * imageWidth
                    let y = (coordinate!.y as! CGFloat) * imageHeight
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .position(x: x ?? 0.0, y: y ?? 0.0)
                }
            }
        }
    }
}
