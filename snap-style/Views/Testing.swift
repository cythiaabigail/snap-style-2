//
//  Testing.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

struct Testing: View {
    
    @State var imageView : UIImage = UIImage(named: "Unknown")!
    @State var realPoint : CGPoint = .zero
    
    var humanJoints : [String: CGPoint] = [:]
    var correctedJoints : [String: CGPoint] = [:]
    
    let scanningBody : ScanningBody = ScanningBody()
    
    init() {
        humanJoints = BodyJoint().detectJoin(image: imageView)
//        correctJoints()
    }
    
    var body: some View {
        GeometryReader { viewSize in
            Image(uiImage: imageView)
                .resizable()
                .onAppear {
//                    self.humanJoints = BodyJoint().detectJoin(image: imageView)
//                    self.imageView = scanningBody.PersonSegmentation(imageView: imageView)
//                    pointToReal(pos: humanJoints.isEmpty ? CGPoint(x: 0.0, y: 0.0) : humanJoints[0], width: viewSize.size.width, height: viewSize.size.height)
//                    print("\(imageView.getPixelColor(pos: realPoint))")
                    imageView = scanningBody.PersonSegmentation(imageView: imageView)
                    correctJoints(imageHeight: viewSize.size.height, imageWidth: viewSize.size.width)
                }.overlay {
                    PointOverlay(imageWidth: viewSize.size.width, imageHeight: viewSize.size.height, coordinates: self.humanJoints)
                }
        }
    }
    
    func pointToReal(pos: CGPoint, width: Double, height: Double) -> CGPoint {
        var position = pos
        position.x = pos.x * imageView.size.width
        position.y = (1-pos.y)*imageView.size.height
        
        print(imageView.size)
        
        return position
    }
    
    func correctJoints(imageHeight: CGFloat, imageWidth: CGFloat) {
        for humanJoint in humanJoints {
            if (humanJoint.key == "left_shoulder_1_joint") {
                // Start reading from right to left
                print(imageView.isColorWhite(at: pointToReal(pos: humanJoint.value, width: imageWidth, height: imageHeight)))
            } else if (humanJoint.key == "right_shoulder_1_joint") {
                // Start reading from left to right
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
            ForEach(0..<coordinates.count-1) { indexCoordinate in
                
                let jointName: String = coordinates.keys[coordinates.index(coordinates.startIndex, offsetBy: indexCoordinate)]
                let coordinate: CGPoint? = coordinates[jointName]
                
                let _ = print("\(coordinates[jointName])")
                
                let x = (coordinate!.x) * imageWidth
                let y = (1-coordinate!.y as! CGFloat) * imageHeight
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                    .position(x: x, y: y)
            }
        }
    }
}
