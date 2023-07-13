//
//  CameraModel.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 12/07/23.
//

import AVFoundation
import UIKit
import SwiftUI

class Camera : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var captureSession = AVCaptureSession()
    @Published var outputCamera = AVCapturePhotoOutput()
    @Published var cameraPreview = AVCaptureVideoPreviewLayer()
    @Published var cameraOutput1 = Data(count: 0)
    @Published var images : [UIImage] = []
    @Published var timerCounter : Int = 25
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private var isCamPermissionGranted = false
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUpCam()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUpCam()
                }
            }
        default:
            isCamPermissionGranted = false
        }
    }
    
    private func setUpCam() {
        do {
            self.captureSession.beginConfiguration()
            
            guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {return}
            guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {return}
            
            if captureSession.canAddInput(videoDeviceInput) {
                captureSession.addInput(videoDeviceInput )
            }
            
            if captureSession.canAddOutput(self.outputCamera) {
                captureSession.addOutput(self.outputCamera)
            }
            
            self.captureSession.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePhoto() {
        DispatchQueue.global(qos: .background).async {
            self.outputCamera.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {return}
        
        self.cameraOutput1 = imageData
        print("photo taken")
        images.append(UIImage(data: imageData)!)
    }
    
    func photoReturn() -> [UIImage] {
        return images
    }
    
    func runTimerForCamera() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if(self.timerCounter == 0 || self.timerCounter == 15) {
                self.takePhoto()
            }
            
            if(self.timerCounter == 0) {
                timer.invalidate()
            }
            
            if(self.timerCounter != 0 ) {
                self.timerCounter = self.timerCounter - 1                
            }
        }
    }
}
