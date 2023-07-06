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
                VStack (alignment: .leading){
                    
                    //START VSTACK SEMUA ISI ABOUT YOU
                    VStack (alignment: .leading){
                        
                        //JUDUL ABOUT YOU
                        Text("About You")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("secondary"))
                            .padding(.bottom)
                            .frame(maxWidth: geo.size.width * 1.9 / 3.0,alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        //START VSTACK ABOUT YOU
                        VStack (alignment: .leading){
                            
                            //START HS ABOUT YOU
                            HStack{
                                //START VS ISI LABEL ABOUT YOU (Stack untuk penamaan gender, height, weight)
                                VStack (alignment: .leading){
                                    Text("Gender")
                                        .padding(.bottom,15)
                                    Text("Height")
                                        .padding(.bottom,15)
                                    Text("Weight")
                                        .padding(.bottom,15)
                                    
                                }
                                .fontWeight(.semibold)
                                .padding(.trailing,50)
                                //END VS ISI LABEL ABOUT YOU
                                
                                
                                //START VS ISI ABOUT YOU (VStack untuk isi dari gender, height, weight)
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(gender == "male" ? "male" : "female")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15,height: 15)
                                        Text(gender == "male" ? "Male" : "Female")
                                    }
                                    .padding(.bottom,15)
                                    HStack{
                                        if (isHeightToggle) {
                                            Text(height == "" ? "Not Set" : "\(height) cm")
                                        } else {
                                            TextField("Height", text: $height)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .padding(.bottom, 5)
                                                .keyboardType(.numberPad)
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
                                                    .foregroundColor(Color("secondary"))
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
                                                .keyboardType(.numberPad)
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
                                                    .foregroundColor(Color("secondary"))
                                            }
                                        }
                                    }
                                    .padding(.bottom,15)
                                }
                                .frame(width: 100)
                                //END VS ISI ABOUT YOU
                            }
                            .frame(alignment: .leading)
                            .foregroundColor(Color("secondary"))
                            //END HS ABOUT YOU
                            
                            
                        }
                        //END VSTACK ABOUT YOU
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("primary"))
                    //END VSTACK SEMUA ISI ABOUT YOU
                    
                    
                    ZStack{
                        
                        VStack (alignment: .leading) {
                            VStack (alignment: .leading){
                                Text("Triangle Body Shape")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("primary"))
                            }
                            .frame(maxWidth: 240, alignment: .leading)
                            .padding(.top)
                            .padding()
                            VStack (alignment: .leading){
                                
                                
                                Text("The waist is the narrowest point on an average man’s torso. The rib cage widens steadily up to the collarbone and shoulders, which are the broadest parts of the torso. This gives the body an overall trapezoidal shape with the shorter side at the bottom.")
                                    .font(.caption)
                                
                                Button(action: {
                                }){
                                    Text("Rescan Body Shape")
                                        .font(.caption)
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth: .infinity, alignment:.center)
                                        .background(Color("primary"))
                                        .foregroundColor(Color("secondary"))
                                        .cornerRadius(4.0)
                                }
                                .padding(.top)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: 240, alignment: .leading)
                            VStack (alignment: .leading){
                                Text("Pro Tips")
                                    .fontWeight(.semibold)
                                    .padding(.bottom,0.1)
                                ScrollView {
                                    
                                    VStack (alignment: .leading){
                                        
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color("yellow"))
                                            Text("Slim-fit clothes to flatter your physiqueadgnflajfas")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color("yellow"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color("yellow"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color("yellow"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color("yellow"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    VStack (alignment: .leading){
                                        
                                        HStack {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(Color("red"))
                                            Text("Slim-fit clothes to flatter your physiqueadgnflajfas physique physique physique physique physique physique physique physique physique ")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(Color("red"))
                                            Text("Slim-fit clothes to flatter your physique physique physique physique physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(Color("red"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(Color("red"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                        HStack {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(Color("red"))
                                            Text("Slim-fit clothes to flatter your physique")
                                        }
                                        .padding(.bottom, 0.1)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.caption)
                                .frame(maxWidth: .infinity, maxHeight: 140, alignment: .leading)
                                
                                Spacer()
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.leading)
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
                        .padding(.top,90)
                        .padding(.trailing,20)
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
