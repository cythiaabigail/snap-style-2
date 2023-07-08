//
//  UiImage+Extension.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

extension UIImage {
    func isColorWhite(at point: CGPoint) -> Bool {
        let image = self
        
        let cgImage = self.cgImage
        
        let pixelData = cgImage!.dataProvider?.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelInfo: Int = ((Int(image.size.width) * Int(point.y)) + Int(point.x)) * 4
        
        let red = data[pixelInfo]
        let green = data[pixelInfo + 1]
        let blue = data[pixelInfo + 2]
        let alpha = data[pixelInfo + 3]
        
        if red > 250 && green > 250 && blue > 250 {
            return true
        }
        
        return false
    }
}
