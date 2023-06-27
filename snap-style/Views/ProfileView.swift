//
//  ProfileView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 27/06/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var height: String = ""
    @State private var weight: String = ""
    
    var body: some View {
        GeometryReader { geo in
            
        ZStack {
            VStack  (alignment: .leading){
                
                VStack (alignment: .leading){
                    
                    
                    Text("Trapezoid Body Shape")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("secondary"))
                        .padding(.bottom)
                        .frame(maxWidth: geo.size.width * 1.9 / 3.0,alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    Text("The waist is the narrowest point on an average man’s torso. The rib cage widens steadily up to the collarbone and shoulders, which are the broadest parts of the torso. This gives the body an overall trapezoidal shape with the shorter side at the bottom.")
                        .font(.caption)
                        .foregroundColor(Color("secondary"))
                        .padding(.bottom,12)
                        .frame(maxWidth: geo.size.width * 1.9 / 3.0, maxHeight:70,alignment: .leading)
                        
                    Text("See more >")
                        .foregroundColor(Color("yellow"))
                        .font(.caption2)
                        .padding(.bottom,20)
                    
                    Button(action: {
                        
                    }){
                        Text("Rescan Body Shape")
                            .padding(.horizontal,24)
                            .padding()
                            .background(Color("secondary"))
                            .foregroundColor(Color("primary"))
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color("secondary"), lineWidth: 2)
                            )
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("primary"))
                
                
                ZStack{
                    
                    VStack (alignment: .leading) {
                        VStack (alignment: .leading){
                                Text("About You")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("primary"))
                        }.padding()
                        ScrollView {
                            VStack (alignment: .leading){
                                
                                HStack{
                                    VStack (alignment: .leading){
                                        Text("Name")
                                            .padding(.bottom,15)
                                        Text("Gender")
                                            .padding(.bottom,15)
                                        Text("Age")
                                            .padding(.bottom,15)
                                        Text("Height")
                                            .padding(.bottom,15)
                                        Text("Weight")
                                            .padding(.bottom,15)
                                        Spacer()
                                        
                                    }
                                    .fontWeight(.semibold)
                                    .padding(.trailing,50)
                                    VStack(alignment: .leading){
                                        
                                        HStack{
                                            Text("Not Set")
                                            Image("pencil")
                                        }
                                        .padding(.bottom,15)
                                        HStack{
                                            Image("male_dark")
                                                .resizable()
                                                .frame(width: 15,height: 15)
                                            Text("Male")
                                        }
                                        .padding(.bottom,15)
                                        HStack{
                                            Text("Not Set")
                                            Image("pencil")
                                        }
                                        .padding(.bottom,15)
                                        HStack{
                                            Text("Not Set")
                                            Image("pencil")
                                        }
                                        .padding(.bottom,15)
                                        HStack{
                                            Text("Not Set")
                                            Image("pencil")
                                        }
                                        .padding(.bottom,15)
                                        Spacer()
                                    }
                                }.padding(.bottom,15)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                
                            }
                            .padding()
                            .background(Color("secondary"))
                        }
                        
                        VStack{
                            
                            Button(action: {
                            }){
                                Text("Save Changes")
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment:.center)
                                    .background(Color("primary"))
                                    .foregroundColor(Color("secondary"))
                                    .cornerRadius(12.0)
                                    .opacity(0.5)
                            }.padding()
                        }
                        .background(Color("secondary"))
                    }
                    
                    Spacer()
                }
                .background(Color("secondary"))
                .cornerRadius(20.0, corners: [.topLeft, .topRight])
                
                
            }
            
            
            VStack (alignment:.trailing){
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width * 0.9 / 3.0,height: geo.size.height / 1.8)
                    .clipped()
                    .frame(maxWidth: .infinity,alignment:.trailing)
                Spacer()
            }
        }
        .background(Color("primary"))
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
