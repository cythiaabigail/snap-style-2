//
//  RecommendationBottomSheetView.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

struct RecommendationBottomSheetView: View {
    
    @Binding var isPreviewShowed: Bool
    @Binding var selectedItem: ClothesStyle?
    
    var body: some View {
        ZStack {
            Color("secondary")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        isPreviewShowed.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(Color("primary"))
                    Spacer()
                    Image(systemName: "heart")
                        .font(.system(size: 25))
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                Spacer().frame(height: 10)
                Image(selectedItem?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 150)
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .background(Color("primary"))
                        .ignoresSafeArea()
                    VStack (alignment: .leading) {
                        Text(selectedItem?.name ?? "")
                            .foregroundColor(Color("secondary"))
                            .fontWeight(.bold)
                            .font(.title2)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(selectedItem?.occasion ?? [], id: \.self) { occasion in
                                    Text(occasion)
                                        .foregroundColor(Color("secondary"))
                                        .padding(.vertical, 4)
                                        .padding(.horizontal,10)
                                        .border(Color("secondary"))
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        Spacer()
                            .frame(height: 25)
                        ScrollView {
                            Text(selectedItem?.description ?? "No Description")
                                .foregroundColor(Color("secondary"))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                }
            }
        }
    }
}

struct RecommendationBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationBottomSheetView(isPreviewShowed: .constant(false), selectedItem: .constant(clothesStyle![0]))
    }
}
