//
//  RecommendationBottomSheetView.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

struct RecommendationBottomSheetView: View {
    
    @Binding var isPreviewShowed: Bool
    
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
                Image("recommendation_preview_example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 150)
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .background(Color("primary"))
                        .ignoresSafeArea()
                    VStack (alignment: .leading) {
                        Text("Full Set Suit & Trousers")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title2)
                        ScrollView(.horizontal) {
                            HStack {
                                Text("Formal")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal,10)
                                    .border(.white)
                                    .fontWeight(.bold)
                                Text("Semi-Formal")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal,10)
                                    .border(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                            .frame(height: 25)
                        ScrollView {
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                .foregroundColor(.white)
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
        RecommendationBottomSheetView(isPreviewShowed: .constant(false))
    }
}
