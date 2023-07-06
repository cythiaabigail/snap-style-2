//
//  OnBoardingThirdView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 26/06/23.
//

import SwiftUI

struct OnBoardingPersonalData: View {
    
    @AppStorage("isNotOnboarding") var isNotOnboarding: Bool = false
    @AppStorage("weight") var weight: String = ""
    @AppStorage("height") var height: String = ""
    
    @Binding var increment: Int
    
    var body: some View {
        VStack {
            HStack{
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .cornerRadius(10.0)
                
                Text("SnapStyle")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.vertical,30)
            
            VStack (alignment: .leading){
                
                Text("Enter Height & Weight")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("Please input the measurements as accurate as possible.")
                    .padding(.bottom, 50)
                
                VStack {
                    VStack(alignment:.leading){
                        Text("Height")
                            .font(.title3)
                        HStack {
                            TextField("", text: $height)
                                .placeholder(when: height.isEmpty) {
                                    Text("Input your height").foregroundColor(.gray)}
                            
                                .padding()
                            Text("cm")
                                .padding()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("secondary"), lineWidth: 2)
                        )
                    }
                    .padding(.bottom)
                    VStack(alignment:.leading){
                        Text("Weight")
                            .font(.title3)
                        HStack {
                            TextField("", text: $weight)
                                .placeholder(when: weight.isEmpty) {
                                    Text("Input your weight").foregroundColor(.gray)}
                                .padding()
                            
                            Text("kg")
                                .padding()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("secondary"), lineWidth: 2)
                        )
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    Button(action: {
                        increment -= 1
                    }){
                        Text("Back")
                            .padding()
                            .frame(maxWidth: .infinity, alignment:.center)
                            .background(Color("primary"))
                            .foregroundColor(Color("secondary"))
                            .cornerRadius(12.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("secondary"), lineWidth: 2)
                            )
                    }.padding()
                    
                    NavigationLink (destination: TabViewComponents(), isActive: $isNotOnboarding) {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity, alignment:.center)
                            .background(height == "" || weight == "" ? Color("grey") : Color("secondary"))
                            .foregroundColor(Color("primary"))
                            .cornerRadius(12.0)
                    }
                    .disabled(height == "" || weight == "")
                }
                
            }
            .padding(.top)
            .padding(.leading)
            .padding()
            .frame(maxWidth: .infinity, alignment:.leading)
            .background(Color("primary"))
            .cornerRadius( 20.0, corners: [.topLeft, .topRight])
            .foregroundColor(Color("secondary"))
            .ignoresSafeArea()
            
        }
    }
}

struct OnBoardingPersonalData_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPersonalData(increment: .constant(2))
    }
}
