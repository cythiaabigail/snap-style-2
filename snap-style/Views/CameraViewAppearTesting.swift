//
//  CameraViewAppearTesting.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 13/07/23.
//

import SwiftUI

struct CameraViewAppearTesting: View {
    var body: some View {
        VStack{
            NavigationStack {
                NavigationLink(destination: CameraViewTesting()) {
                    Text("testing")
                }
            }
        }
    }
}

struct CameraViewAppearTesting_Previews: PreviewProvider {
    static var previews: some View {
        CameraViewAppearTesting()
    }
}
