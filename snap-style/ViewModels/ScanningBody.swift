//
//  ScanningBody.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 06/07/23.
//

import Vision
import SwiftUI
import CoreImage.CIFilterBuiltins

class ScanningBody {
    var imageUi : UIImage?
    
    //segmentation person for matte effect
    func PersonSegmentation(imageView: UIImage) -> UIImage {
        imageUi = imageView
        let imageCii = CIImage(cgImage: imageView.cgImage!)
        let request = VNGeneratePersonSegmentationRequest()
        
        request.revision = VNGenerateOpticalFlowRequestRevision1
        request.qualityLevel = .fast
        request.outputPixelFormat = kCVPixelFormatType_OneComponent8
        
        let requestHandler = VNImageRequestHandler(ciImage: imageCii)
        
        do {
            try requestHandler.perform([request])
            let mask = request.results!.first!
            
            let maskBuffer = mask.pixelBuffer
            return maskInputImage(maskBuffer: maskBuffer)
        } catch {
            print("errors")
        }
        
#if targetEnvironment(simulator)
request.usesCPUOnly = true
#endif
        
        return imageUi!
    }
    
    //masking the white color for human segmentation and make backgroudn black
    func maskInputImage(maskBuffer: CVPixelBuffer) -> UIImage {
        let inputImage = CIImage(cgImage: imageUi!.cgImage!)
        let maskImage = CIImage(cvImageBuffer: maskBuffer)
        
        let maskScaleX = inputImage.extent.width / maskImage.extent.width
        let maskScaleY = inputImage.extent.height / maskImage.extent.height
        let maskScaled = maskImage.transformed(by: __CGAffineTransformMake(maskScaleX, 0, 0, maskScaleY, 0, 0))
        
        let blendFilter = CIFilter.blendWithMask()
        blendFilter.inputImage = inputImage
        blendFilter.maskImage = maskScaled
        
        if let blendedImage = blendFilter.outputImage {
            let ciContext = CIContext(options: nil)
            let maskDisplayRef = ciContext.createCGImage(maskScaled, from: maskScaled.extent)
            let testing = UIImage(cgImage: maskDisplayRef!)
            return UIImage(cgImage: maskDisplayRef!)
        }
        return imageUi!
    }
}
