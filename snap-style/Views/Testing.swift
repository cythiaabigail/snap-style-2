//
//  Testing.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

struct Testing: View {
    
    var imageView : UIImage = UIImage(named: "Unknown")!
    @State var realPoint : CGPoint = .zero
    
    var humanJoints : [String: CGPoint] = [:]
    var correctedJoints : [String: CGPoint] = [:]
    
    let scanningBody : ScanningBody = ScanningBody()
    
    init() {
        humanJoints = BodyJoint().detectJoin(image: imageView)
        imageView = scanningBody.PersonSegmentation(imageView: imageView)
        humanJoints = BodyJoint().configJoint(humanJoints: humanJoints, image: imageView)
        let firstJoint = humanJoints["right_shoulder_1_joint"]
        let leftJoint = humanJoints["left_shoulder_1_joint"]
        let valuePerPixel = BodyCalculation(image: imageView, fixedTall: 165.0).imagePixelPersize(humanJoints: self.humanJoints)
        let range = BodyJoint().jointRange(firstJoint: firstJoint ?? CGPoint(x: 0.0, y: 0.0), secondJoint: leftJoint ?? CGPoint(x: 0.0, y: 0.0), sizePerPixel: valuePerPixel, image: imageView)
        
        print(range)
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
