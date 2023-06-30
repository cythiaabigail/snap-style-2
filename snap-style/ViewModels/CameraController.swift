//
//  CameraViewController.swift
//  TestingScanning3D
//
//  Created by dary winata nugraha djati on 26/06/23.
//

import Foundation
import AVFoundation
import UIKit
import SwiftUI
import os.log

class CameraController : UIViewController{
    private var isCamPermissionGranted = false
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private var addToPhotoStream: ((AVCapturePhoto) -> Void)?
    private var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect : CGRect! = nil
    private var photoOutput : AVCapturePhotoOutput!
    private var deviceInput : AVCaptureDeviceInput?
    
    lazy var photoStream: AsyncStream<AVCapturePhoto> = {
        AsyncStream { continuation in
            addToPhotoStream = { photo in
                continuation.yield(photo)
            }
        }
    }()
    
    override func viewDidLoad() {
        checkCamPermission()
        
        sessionQueue.async { [unowned self] in
            guard self.isCamPermissionGranted else {return}
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }
    
    private func checkCamPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            isCamPermissionGranted = true
        case .notDetermined:
            requestCamPermission()
        default:
            isCamPermissionGranted = false
        }
    }
    
    private func requestCamPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.isCamPermissionGranted = granted
            self.sessionQueue.resume()
        }
    }
    
    private func setupCaptureSession() {
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {return}
        //        videoDevice.position = .front
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {return}
        
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        captureSession.addInput(videoDeviceInput)
        
        let photoOutput = AVCapturePhotoOutput()
        captureSession.addOutput(photoOutput)
        
        screenRect = UIScreen.main.bounds
        
        self.photoOutput = photoOutput
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        previewLayer.connection?.videoOrientation = .portrait
        
        DispatchQueue.main.async {
            self.view.layer.addSublayer(self.previewLayer)
        }
    }
    
    func takePhoto() {
        guard let photoOutput = self.photoOutput else { return }
        
        sessionQueue.async {
            
            var photoSettings = AVCapturePhotoSettings()
            
            
            if photoOutput.availablePhotoCodecTypes.contains(.hevc) {
                photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
            }
            
            let isFlashAvailable = self.deviceInput?.device.isFlashAvailable ?? false
            photoSettings.flashMode = .off
            //            photoSettings.isHighResolutionPhotoEnabled = true
            if let previewPhotoPixelFormatType = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
                photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoPixelFormatType]
            }
            photoSettings.photoQualityPrioritization = .balanced
            
            if let photoOutputVideoConnection = photoOutput.connection(with: .video) {
                photoOutputVideoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            }
            
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
    
    //    func handleCamera() async {
    //        let imageStream = previewStream
    //    }
    
    //    lazy var previewStream: AsyncStream<CIImage> = {
    //    /*#-code-walkthrough(previewflow.previewStream)*/
    //        AsyncStream { continuation in
    //            addToPreviewStream = { ciImage in
    //                if !self.isPreviewPaused {
    //                    continuation.yield(ciImage)
    //                }
    //            }
    //        }
    //    }()
}

struct HostedViewController : UIViewControllerRepresentable {
    
    @Binding var countingTimer : Int
    @Binding var isPhotoTaken : Bool
    
    var cameraViewController = CameraController()
    
    func makeUIViewController(context: Context) -> UIViewController {
        return cameraViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
    func timerTakePhoto() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if(countingTimer == 0 || countingTimer == 10) {
                cameraViewController.takePhoto()
            }
            
            if(countingTimer == 0) {
                isPhotoTaken = true
                timer.invalidate()
            }
            
            countingTimer = countingTimer - 1
        }
    }
//
//    @objc func timerTask(timer: Timer) {
//        if(countingTimer % 5 == 0) {
//            takePhoto()
//        }
//
//        if(countingTimer == 10) {
//            timer.invalidate()
//        }
//    }
}

extension CameraController: AVCapturePhotoCaptureDelegate  {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        } else {
            print("captured")
        }
        
        /*#-code-walkthrough(photoflow.addToPhotoStream)*/
        addToPhotoStream?(photo)
    }
}
