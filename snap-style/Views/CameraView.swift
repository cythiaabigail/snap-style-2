////
////  CameraView.swift
////  snap-style
////
////  Created by dary winata nugraha djati on 30/06/23.
////
//
//import SwiftUI
//
//struct CameraView: View {
//    @State var isPhotoAlreadyTaken : Bool = false
//    @State var countingCameraTime : Int = 15
//    @State var hostedViewController : HostedViewController?
//    @State var isShutterClicked : Bool = false
//    @State var isAlertPopup : Bool = false
//    @State var valueOfPhoto : UIImage
//    
//    var body: some View {
//        GeometryReader { screenSize in
//            if(isPhotoAlreadyTaken) {
//                TestingView(imageFirst: valueOfPhoto)
//            } else {
//                GeometryReader { screenSize in
//                    ZStack {
//                        hostedViewController
//                        VStack {
//                            Spacer()
//                            Image("Outline_Camera").resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: screenSize.size.width, height: screenSize.size.height*2/3)
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10).fill(.gray)
//                                    .frame(maxWidth: screenSize.size.width*2/3, maxHeight: 30)
//                                    .opacity(0.6)
//                                Text("Position your body inside the border").font(.system(size: 10))
//                                    .padding(5)
//                                    .foregroundColor(.white)
//                            }
//                            .font(.system(size: 15))
//                            .padding()
//                            ZStack {
//                                Button {
//                                    Task {
//                                        let value = await hostedViewController?.takePhoto()
//                                        valueOfPhoto = value ?? []
//                                        isPhotoAlreadyTaken.toggle()
//                                    }
////                                    hostedViewController?.timerTakePhoto()
////                                    isShutterClicked = true
//                                } label: {
//                                    Circle()
//                                        .stroke(Color.white, lineWidth: 2)
//                                        .frame(width: 60, height: 60)
//                                }
//                                Circle().fill(.white).frame(width: 50, height: 50)
//                                if(isShutterClicked) {
//                                    Text("\(countingCameraTime>10 ? countingCameraTime-10 : countingCameraTime)").foregroundColor(.black)
//                                } else {
//                                    Image("IconStopwatch")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(maxWidth: 40, maxHeight: 40)
//                                }
//                            }
//                        }
//                    }
//                }.onAppear {
//                    hostedViewController = HostedViewController(countingTimer: $countingCameraTime, isPhotoTaken: $isPhotoAlreadyTaken)
//                }.onChange(of: countingCameraTime) { _ in
//                    if countingCameraTime < 11 && countingCameraTime > 5 {
//                        isAlertPopup = true
//                    } else {
//                        isAlertPopup = false
//                    }
//                }.alert("PLEASE CHANGE YOUR POSITION", isPresented: $isAlertPopup) {
//                    
//                } message: {
//                    Text("Please change your direction according to outline")
//                }
//            }
//        }
//    }
//}
//
//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
