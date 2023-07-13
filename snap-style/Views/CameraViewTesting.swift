//
//  CameraViewTesting.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 12/07/23.
//

import SwiftUI

struct CameraViewTesting: View {
    
    @StateObject var camera = Camera()
    
    @State var isClicked = false
    @State var imageFirst : UIImage = UIImage()
    @State var imageSecond : UIImage = UIImage()
    @State var isAlertPopup : Bool = false
    @State var isShutterClicked : Bool = false
    @State var animationTimer : Timer?
    
    var body: some View {
        if isClicked {
            BodyRecognitionView(images: camera.photoReturn())
        } else {
            GeometryReader { screenSize in
                ZStack {
                    CameraPreviewRepresentable(camera: camera)
                    VStack {
                        Spacer()
                        if camera.timerCounter < 15 {
                            Image("right_handsup").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: screenSize.size.width, height: screenSize.size.height*4/5)
                        } else {
                            Image("front_handsup").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: screenSize.size.width, height: screenSize.size.height*4/5)
                        }
                        ZStack {
                            Button {
                                isShutterClicked.toggle()
                                camera.runTimerForCamera()
                            } label: {
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 60, height: 60)
                            }.disabled(isShutterClicked)
                            Circle().fill(.white).frame(width: 50, height: 50)
                            if isAlertPopup {
                                Image("IconStopwatch")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 40, maxHeight: 40)
                            }
                            else if(isShutterClicked) {
                                Text("\(camera.timerCounter > 15 ? camera.timerCounter-15 : camera.timerCounter)").foregroundColor(.black)
                            } else {
                                Image("IconStopwatch")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 40, maxHeight: 40)
                            }
                        }
                    }
                }.task {
                    camera.checkPermission()
                }.onChange(of: camera.images) { _ in
                    if camera.images.count == 2 {
                        isClicked.toggle()
                    }
                }.onChange(of: camera.timerCounter, perform: { counter in
                    if counter == 15 {
                        isAlertPopup.toggle()
                    } else if counter == 10 && isAlertPopup {
                        isAlertPopup.toggle()
                    }
                }).onChange(of: isAlertPopup, perform: { newValue in
                    if isAlertPopup == false {
                        animationTimer?.invalidate()
                    }
                })
                .sheet(isPresented: $isAlertPopup) {
                    CameraAlertModal(imageSequenceTimer: animationTimer)
                }
            }
        }
    }
}

struct CameraViewTesting_Previews: PreviewProvider {
    static var previews: some View {
        CameraViewTesting()
    }
}
