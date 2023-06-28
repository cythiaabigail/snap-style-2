//
//  ProfileView.swift
//  snap-style
//
//  Created by Denny Chandra Wijaya on 27/06/23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("gender") var gender: String = ""
    @AppStorage("height") var height: String = ""
    @AppStorage("weight") var weight: String = ""
    @AppStorage("age") var age: String = ""
    
    @State var isWeightToogle: Bool = true
    @State var isHeightToggle: Bool = true
    @State var isAgeToggle: Bool = true
    @State var isNameToggle: Bool = true
    
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
                                .padding(.vertical,12)
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
                                                if (isNameToggle) {
                                                    Text(name == "" ? "Not Set" : name)
                                                } else {
                                                    TextField("Name", text: $name)
                                                        .textFieldStyle(PlainTextFieldStyle())
                                                        .padding(.bottom, 5)
                                                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)

                                                }
                                                Spacer()
                                                Button  {
                                                    isNameToggle.toggle()
                                                } label: {
                                                    if (isNameToggle) {
                                                        Image("pencil")
                                                    } else {
                                                        Image(systemName: "square.and.arrow.down")
                                                            .foregroundColor(Color("primary"))
                                                    }
                                                }
                                            }
                                            .padding(.bottom,15)
                                            HStack{
                                                Image(gender == "male" ? "male_dark" : "female_dark")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 15,height: 15)
                                                Text(gender == "male" ? "Male" : "Female")
                                            }
                                            .padding(.bottom,15)
                                            HStack{
                                                if (isAgeToggle) {
                                                    Text(age == "" ? "Not Set" : age)
                                                } else {
                                                    TextField("Age", text: $age)
                                                        .textFieldStyle(PlainTextFieldStyle())
                                                        .padding(.bottom, 5)
                                                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)

                                                }
                                                Spacer()
                                                Button  {
                                                    isAgeToggle.toggle()
                                                } label: {
                                                    if (isAgeToggle) {
                                                        Image("pencil")
                                                    } else {
                                                        Image(systemName: "square.and.arrow.down")
                                                            .foregroundColor(Color("primary"))
                                                    }
                                                }
                                            }
                                            .padding(.bottom,15)
                                            HStack{
                                                if (isHeightToggle) {
                                                    Text(height == "" ? "Not Set" : "\(height) cm")
                                                } else {
                                                    TextField("Height", text: $height)
                                                        .textFieldStyle(PlainTextFieldStyle())
                                                        .padding(.bottom, 5)
                                                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
                                                }
                                                Spacer()
                                                Button  {
                                                    isHeightToggle.toggle()
                                                } label: {
                                                    if (isHeightToggle) {
                                                        Image("pencil")
                                                    } else {
                                                        Image(systemName: "square.and.arrow.down")
                                                            .foregroundColor(Color("primary"))
                                                    }
                                                }
                                            }
                                            .padding(.bottom, 15)
                                            HStack{
                                                if (isWeightToogle) {
                                                    Text(weight == "" ? "Not Set" : "\(weight) kg")
                                                } else {
                                                    TextField("Weight", text: $weight)
                                                        .textFieldStyle(PlainTextFieldStyle())
                                                        .padding(.bottom, 5)
                                                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
                                                }
                                                Spacer()
                                                Button  {
                                                    isWeightToogle.toggle()
                                                } label: {
                                                    if (isWeightToogle) {
                                                        Image("pencil")
                                                    } else {
                                                        Image(systemName: "square.and.arrow.down")
                                                            .foregroundColor(Color("primary"))
                                                    }
                                                }
                                            }
                                            .padding(.bottom,15)
                                            Spacer()
                                        }
                                    }.padding(.bottom,15)
                                        .frame(maxWidth: 250, alignment: .leading)
                                    
                                    
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
                                    .padding(.horizontal,30)
                                    .padding(.bottom,100)
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
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
