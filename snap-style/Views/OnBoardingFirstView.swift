//
//  OnBoardingFirstView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 26/06/23.
//

import SwiftUI

struct OnBoardingFirstView: View {
    @Binding var increment: Int
    var body: some View {
        VStack{
            
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 125, height: 203)
                .cornerRadius(10.0)
            
            Spacer()
            
            
            Text("Welcome")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,15)
            Text("Learn the best outfit styles for your body shape")
                .frame(maxWidth: 250.0)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            
            Button(action: {
                increment += 1
            }){
                Text("Get Started")
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.center)
                    .background(Color("primary"))
                    .foregroundColor(Color("secondary"))
                    .cornerRadius(12.0)
            }.padding()
        }
    }
}

struct OnBoardingFirstView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingFirstView(increment: .constant(0))
    }
}
