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
                    OnBoardingGetStarted(increment:$increment)
                }else if(increment == 1){
                    OnBoardingGenderPicker(increment:$increment)
                }else{
                    OnBoardingPersonalData(increment:$increment)
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






