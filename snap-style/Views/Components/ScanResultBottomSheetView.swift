//
//  ScanResultBottomSheetView.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

struct ScanResultBottomSheetView: View {
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

struct ScanResultBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultBottomSheetView(isSheetPresented: .constant(false), bodyShapeTitle: "Testing", bodyShapeDescription: "Description")
    }
}
