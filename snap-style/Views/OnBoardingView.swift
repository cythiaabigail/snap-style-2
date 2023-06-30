//
//  OnBoardingView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 23/06/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State  var increment: Int = 0
    var body: some View {
        NavigationStack{
            VStack {
                if(increment == 0){
                    OnBoardingFirstView(increment:$increment)
                }else if(increment == 1){
                    OnBoardingSecondView(increment:$increment)
                }else{
                    OnBoardingThirdView(increment:$increment)
                }
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}






