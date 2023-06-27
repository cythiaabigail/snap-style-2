//
//  ScanResultView.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

struct ScanResultView: View {
    @State private var isSheetPresented = false
    
    var bodyShapeTitle: String = "Trapezoid"
    var bodyShapeDescription: String = "The waist is the narrowest point on an average man’s torso. The rib cage widens steadily up to the. collarbone and shoulders, which are the broadest parts of the torso. This gives the body an overall trapezoidal shape with the shorter side at the bottom collarbone and shoulders, which are the broadest parts of the torso. This gives the body an overall trapezoidal shape with the shorter side at the bottom"

    var body: some View {
        VStack(alignment: .center) {
            Image("body_shape_trapezoid")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding(.bottom, 30)
            Text("Your Body Shape is \(bodyShapeTitle)")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 30)
            Button(action: {
                isSheetPresented.toggle()
            }) {
                Text("Show Detail About Body Shape")
                    .padding()
                    .background(Color("primary"))
                    .foregroundColor(Color("secondary"))
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
            BottomSheetView(isSheetPresented: $isSheetPresented, bodyShapeTitle: bodyShapeTitle, bodyShapeDescription: bodyShapeDescription)
                .presentationDetents(
                    [.fraction(0.5), .medium, .large, .fraction(0.8)]
                )
        })
    }
}

struct BottomSheetView: View {
    
    @Binding var isSheetPresented: Bool
    let bodyShapeTitle: String
    let bodyShapeDescription: String

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(bodyShapeTitle) Body Shape")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                Spacer()
                    .frame(height: 20)
                Text(bodyShapeDescription)
                Spacer()
                    .frame(height: 20)
                Text("Pro Tips :")
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Slim-fit clothes to flatter your physique")
                }
                    .padding(.bottom, 0.1)
                HStack {
                    Image(systemName: "checkmark.circle.fill")
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
                Spacer()
            }
            Button(action: {
                isSheetPresented = false
            }) {
                Text("See Your Personalized Style")
                    .padding()
                    .background(Color("primary"))
                    .foregroundColor(Color("secondary"))
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)

        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .frame(width: 400)
        .frame(width: .infinity)
        .background(Color("secondary"))
        .cornerRadius(10)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView()
    }
}
