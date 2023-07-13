//
//  TestingView.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 13/07/23.
//

import SwiftUI

struct TestingView: View {
    let imageFirst : [UIImage]
    
    var body: some View {
        VStack {
            Image(uiImage: imageFirst[0]).resizable().scaledToFit()
            Image(uiImage: imageFirst[1]).resizable().scaledToFit()
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView(imageFirst: [UIImage(named: "body_schema")!])
    }
}
