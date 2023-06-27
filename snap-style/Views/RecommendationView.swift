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
    
    let listBodyShape = BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)
    
    let listStyle = [ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto1", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto2", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto3", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
    ]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Color("secondary")]
    }
    
    let pinterestColoum = [
        GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { screenSize in
//            NavigationStack {
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
                            LazyVGrid (columns: pinterestColoum) {
                                ForEach(0...listStyle.count-1, id: \.self) { styleIndex in
                                    if styleIndex % 2 == 0 {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.1)
                                                .frame(width: 169)
                                            Image(listStyle[styleIndex].image)
                                                .padding(.vertical, 10)
                                        }.onTapGesture {
                                            isClothClicked = true
                                            selectedStyle = listStyle[styleIndex]
                                            print(selectedStyle?.image)
                                        }
                                    }
                                }
                            }
                            LazyVGrid (columns: pinterestColoum) {
                                ForEach(0...listStyle.count-1, id: \.self) { styleIndex in
                                    if styleIndex % 2 == 1 {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.1)
                                                .frame(width: 169)
                                            Image(listStyle[styleIndex].image)
                                                .padding(.vertical, 10)
                                        }.padding(.bottom, 11).onTapGesture {
                                            isClothClicked = true
                                            selectedStyle = listStyle[styleIndex]
                                            print(selectedStyle?.image)
                                        }
                                    }
                                }
                            }.padding(.top, 10)
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
//            }.navigationBarBackButtonHidden(true)
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
