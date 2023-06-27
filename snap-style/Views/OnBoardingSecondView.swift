//
//  OnBoardingSecondView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 26/06/23.
//

import SwiftUI


struct OnBoardingSecondView: View {
    @Binding var increment: Int
    @State private var isMaleChecked = false
    @State private var isFemaleChecked = false
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
                
                Text("Select Gender")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("This helps us find you more relevant recommendation. ")
                    .padding(.bottom, 50)
                
                HStack{
                    
                    
                    
                    Button (action:{
                        isMaleChecked.toggle()
                        isFemaleChecked = false
                    }) {
                        VStack{
                            Image(isMaleChecked ? "male_dark" : "male")
                                .resizable()
                                .frame(width: 80, height: 80)
                            Text("Male")
                                .font(.title2)
                            
                            .foregroundColor(isMaleChecked ? Color("primary") : Color("secondary"))
                            
                        }
                        .frame(width: 80,height: 200)
                        .padding(30)
                        .background(isMaleChecked ? Color("secondary") : Color("primary"))
                        .cornerRadius(10.0)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("secondary"), lineWidth: 2)
                    )
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        isFemaleChecked.toggle()
                        isMaleChecked = false
                    }) {
                        VStack{
                            Image(isFemaleChecked ? "female_dark" : "female")
                                .resizable()
                                .frame(width: 55, height: 80)
                            Text("Female")
                                .font(.title2)
                                .foregroundColor(isFemaleChecked ? Color("primary") : Color("secondary"))
                        }
                        .frame(width: 80,height: 200)
                        .padding(30)
                        .background(isFemaleChecked ? Color("secondary") : Color("primary"))
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("secondary"), lineWidth: 2)
                    )
                    }
                    Spacer()
                }
                
                Spacer()
                
                
                Button(action: {
                    increment += 1
                }){
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity, alignment:.center)
                        .background(Color("secondary"))
                        .foregroundColor(Color("primary"))
                        .cornerRadius(12.0)
                }.padding()
                
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

struct OnBoardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSecondView(increment: .constant(1))
    }
}
