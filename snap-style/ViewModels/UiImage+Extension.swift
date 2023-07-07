//
//  UiImage+Extension.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import SwiftUI

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor? {
        let height = self.size.height
        let width = self.size.width
        
        guard pos.x >= 0 && pos.x < width && pos.y >= 0 && pos.y < height,
            let cgImage = cgImage,
            let provider = cgImage.dataProvider,
            let providerData = provider.data,
            let data = CFDataGetBytePtr(providerData) else {
            return nil
        }

        let numberOfComponents = 4.0
        let pixelData : Int = Int((width * pos.y + pos.x) * numberOfComponents)

        let r = CGFloat(data[pixelData]) / 255.0
        let g = CGFloat(data[pixelData + 1]) / 255.0
        let b = CGFloat(data[pixelData + 2]) / 255.0
        let a = CGFloat(data[pixelData + 3]) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
