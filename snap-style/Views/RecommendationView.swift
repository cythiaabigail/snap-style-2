//
//  RecommendationView.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 24/06/23.
//

import SwiftUI

struct RecommendationView: View {
    
    let occationPickers : [String] = ["Formal", "Semi Formal", "Casual"]
    let piecePickers : [String] = ["Outter", "Pants", "Full"]
    let colorPickers : [String] = ["Red", "Green", "Blue"]
    
    @State var occationPick : String = "All Occation"
    @State var piecePick : String = "All Piece"
    @State var colorPick : String = "All Color"
    @State var isClothClicked : Bool = false
    @State var selectedStyle : ClothesStyle?
    
    let pinterestColumn = [GridItem(.flexible())]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Color("secondary")]
    }
    
    var mappedImages: Dictionary<String, [ClothesStyle]?> {
        
        var idx = 0
        var leftImages: [ClothesStyle]? = []
        var rightImages: [ClothesStyle]? = []
        
        for cs in (clothesStyle ?? []) {
            if (idx % 2 == 0) {
                leftImages?.append(cs)
            } else {
                rightImages?.append(cs)
            }
            idx += 1
        }
        
        return [
            "left": leftImages,
            "right": rightImages
        ]
    }
    
    var body: some View {
        GeometryReader { screenSize in
                VStack {
                    HStack {
                        Text("Styles For You").font(.system(.largeTitle, weight: .bold)).foregroundColor(Color("secondary"))
                        Spacer()
                        Image(systemName: "heart").resizable().frame(width: 24.44, height: 22.41).foregroundColor(Color("secondary"))
                    }.padding(.bottom, 40)
                    
                    HStack {
                        Text("Filter").font(.system(size: 20, weight: .bold)).foregroundColor(Color("secondary"))
                        Spacer()
                    }
                    
                    HStack {
                        RecommendationPickerComponent(choosePicker: $occationPick, dataPickers: occationPickers)
                        Spacer()
                        RecommendationPickerComponent(choosePicker: $piecePick , dataPickers: piecePickers)
                        Spacer()
                        RecommendationPickerComponent(choosePicker: $colorPick, dataPickers: colorPickers)
                    }
                    
                    ScrollView {
                        HStack {
                            LazyVGrid (columns: pinterestColumn) {
                                ForEach((mappedImages["left"] ?? [])!, id: \.self) { leftItem in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.1)
                                            .frame(width: 169)
                                        Image(leftItem.image)
                                            .padding(.vertical, 10)
                                    }.onTapGesture {
                                        isClothClicked = true
                                        selectedStyle = leftItem
                                    }
                                }
                            }.frame(maxHeight: .infinity, alignment: .top)
                            LazyVGrid (columns: pinterestColumn) {
                                ForEach((mappedImages["right"] ?? [])!, id: \.self) { rightItem in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.1)
                                            .frame(width: 169)
                                        Image(rightItem.image)
                                            .padding(.vertical, 10)
                                    }.onTapGesture {
                                        isClothClicked = true
                                        selectedStyle = rightItem
                                    }
                                }
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                        }.padding(.top, 5)
                    }.frame(maxWidth: .infinity)
                        .background(Color("secondary"))
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            ).inset(by: -1)
                        )
                        .ignoresSafeArea()
                        .frame(width: .infinity)
                        .padding(.horizontal, -14)
                }.padding(.horizontal, 14).padding(.top, 20)
                    .background(Color.black)
        }
        .sheet(isPresented: $isClothClicked) {
            RecommendationBottomSheetView(isPreviewShowed: $isClothClicked)
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
