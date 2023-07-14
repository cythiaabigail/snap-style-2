//
//  CameraAlertModal.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 13/07/23.
//

import SwiftUI

struct CameraAlertModal: View {
    @State var imageSequenceTimer : Timer?
    @State var indexImage : Int = 0
    let images : [String] = ["front_animate", "halfside_animate", "side_animate", "last_animate"]
    
    var body: some View {
        VStack {
            Image(images[indexImage]).resizable().scaledToFit()
        }.padding(.vertical, 10).onAppear {
            imageSequenceTimer = Timer.scheduledTimer(withTimeInterval: 0.65, repeats: true, block: { _ in               indexImage = indexImage + 1

                if indexImage == 4 {
                    indexImage = 0
                }
            })
        }
    }
}

//struct CameraAlertModal_Previews: PreviewProvider {
//    static var previews: some View {
////        CameraAlertModal(imageSequenceTimer: .constant(Timer()))
//        CameraAlertModal()
//    }
//}
