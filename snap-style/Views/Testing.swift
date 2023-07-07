//
//  Testing.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

struct Testing: View {
    @State var imageView : UIImage = UIImage(named: "Unknown")!
    @State var humanJoints : [CGPoint] = []
    @State var realPoint : CGPoint = .zero
    let scanningBody : ScanningBody = ScanningBody()
    
    var body: some View {
        GeometryReader { viewSize in
            Image(uiImage: imageView)
                .resizable()
                .onAppear {
                    self.humanJoints = BodyJoint().detectJoin(image: imageView)
                    self.imageView = scanningBody.PersonSegmentation(imageView: imageView)
                    pointToReal(pos: humanJoints.isEmpty ? CGPoint(x: 0.0, y: 0.0) : humanJoints[0], width: viewSize.size.width, height: viewSize.size.height)
                    print("\(imageView.getPixelColor(pos: realPoint))")
                }.overlay {
                    PointOverlay(imageWidth: viewSize.size.width, imageHeight: viewSize.size.height, coordinates: humanJoints)
                }
        }
    }
    
    func pointToReal(pos: CGPoint, width: Double, height: Double) {
        self.realPoint.x = pos.x * width
        self.realPoint.y = (1-pos.y)*height
        print(self.realPoint.x)
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
    var coordinates: [CGPoint]
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(coordinates.indices, id: \.self) { indexCoordinate in
                let x = (coordinates[indexCoordinate].x) * imageWidth
                let y = (1-coordinates[indexCoordinate].y as! CGFloat) * imageHeight
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                    .position(x: x, y: y)
            }
        }
    }
}
