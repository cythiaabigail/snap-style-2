//
//  CameraViewRepresentable.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 12/07/23.
//

import SwiftUI
import AVFoundation

struct CameraPreviewRepresentable : UIViewRepresentable {
    @ObservedObject var camera : Camera
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
//        DispatchQueue.main.async {
        camera.cameraPreview = AVCaptureVideoPreviewLayer(session: camera.captureSession)            
//        }
        camera.cameraPreview.frame = view.frame
        camera.cameraPreview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        camera.cameraPreview.connection?.videoOrientation = .portrait
        
        view.layer.addSublayer(camera.cameraPreview)
        
//        DispatchQueue.global(qos: .background).async {
        camera.captureSession.startRunning()
//        }
        
        return view
    }
}
