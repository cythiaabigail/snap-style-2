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
    let pinterestColumn = [GridItem(.flexible())]

    @State var scrollPosition : CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State var occationPicks : [String] = []
    @State var piecePicks : [String] = []
    @State var colorPicks : [String] = []
    @State var isClothClicked : Bool = false
    @State var selectedStyle : ClothesStyle?
    @State var isFilterClicked : Bool = false
    @State var isFavoriteOnly : Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Color("secondary")]
    }
    
    var mappedImages: Dictionary<String, [ClothesStyle]?> {
        
        var idx = 0
        var leftImages: [ClothesStyle]? = []
        var rightImages: [ClothesStyle]? = []
        
        var shuffledClothes: [ClothesStyle]? = clothesStyle
        
        if (isFavoriteOnly) {
            idx = 0
            shuffledClothes = shuffledClothes?.filter({ $0.isFavorite })
        } else {
            shuffledClothes = shuffledClothes?.shuffled() 
        }
        
        for cs in (shuffledClothes ?? []) {
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
                        Image(systemName: (isFavoriteOnly ? "heart.fill" : "heart")).resizable().frame(width: 24.44, height: 22.41).foregroundColor(Color("secondary"))
                            .onTapGesture {
                                isFavoriteOnly.toggle()
                            }
                    }.padding(.bottom, 40)
                    
                    ZStack {
                        ScrollView(.horizontal) {
                            HStack {
                                HStack {
                                    Button {
                                    } label: {
                                        HStack {
                                            Image("filter_icon")
                                            Text("Filter").font(.system(size: 20, weight: .bold)).foregroundColor(Color.white)
                                        }
                                    }
                                    Spacer()
                                }.hidden()
                                
                                Button {
                                    if occationPicks.contains("Formal") {
                                        occationPicks
                                            .removeAll(where: {$0 == "Formal"})
                                    } else {
                                        occationPicks.append("Formal")
                                    }
                                } label: {
                                    Text("Formal")
                                        .font(.system(size: 13))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 6)
                                        .foregroundColor(occationPicks.contains("Formal") ? .white : .white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(occationPicks.contains("Formal") ? .white : .white, lineWidth: 1)
                                        )
                                        .background(occationPicks.contains("Formal") ? .gray : .black)
                                        .cornerRadius(4)
                                }
                                
                                Button {
                                    if occationPicks.contains("Formal") {
                                        occationPicks
                                            .removeAll(where: {$0 == "Formal"})
                                    } else {
                                        occationPicks.append("Formal")
                                    }
                                } label: {
                                    Text("Formal")
                                        .font(.system(size: 13))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 6)
                                        .foregroundColor(occationPicks.contains("Formal") ? .white : .white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(occationPicks.contains("Formal") ? .white : .white, lineWidth: 1)
                                        )
                                        .background(occationPicks.contains("Formal") ? .gray : .black)
                                        .cornerRadius(4)
                                }
                                
                                Button {
                                    if occationPicks.contains("Formal") {
                                        occationPicks
                                            .removeAll(where: {$0 == "Formal"})
                                    } else {
                                        occationPicks.append("Formal")
                                    }
                                } label: {
                                    Text("Formal")
                                        .font(.system(size: 13))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 6)
                                        .foregroundColor(occationPicks.contains("Formal") ? .white : .white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(occationPicks.contains("Formal") ? .white : .white, lineWidth: 1)
                                        )
                                        .background(occationPicks.contains("Formal") ? .gray : .black)
                                        .cornerRadius(4)
                                }
                                Button {
                                    if occationPicks.contains("Formal") {
                                        occationPicks
                                            .removeAll(where: {$0 == "Formal"})
                                    } else {
                                        occationPicks.append("Formal")
                                    }
                                } label: {
                                    Text("Formal")
                                        .font(.system(size: 13))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 6)
                                        .foregroundColor(occationPicks.contains("Formal") ? .white : .white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(occationPicks.contains("Formal") ? .white : .white, lineWidth: 1)
                                        )
                                        .background(occationPicks.contains("Formal") ? .gray : .black)
                                        .cornerRadius(4)
                                }
                                
                                Button {
                                    if occationPicks.contains("Formal") {
                                        occationPicks
                                            .removeAll(where: {$0 == "Formal"})
                                    } else {
                                        occationPicks.append("Formal")
                                    }
                                } label: {
                                    Text("Formal")
                                        .font(.system(size: 13))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 6)
                                        .foregroundColor(occationPicks.contains("Formal") ? .white : .white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(occationPicks.contains("Formal") ? .white : .white, lineWidth: 1)
                                        )
                                        .background(occationPicks.contains("Formal") ? .gray : .black)
                                        .cornerRadius(4)
                                }
                            }
                            .background(
                                GeometryReader { scrollPos in
                                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: scrollPos.frame(in: .named("scroll")).origin)
                                }
                            )
                            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { scrollValue in
                                self.scrollPosition = scrollValue
                            }
                        }.scrollIndicators(.hidden)
                        HStack {
                            Button {
                                isFilterClicked = true
                            } label: {
                                HStack {
                                    Image("filter_icon")
                                    Text("Filter").font(.system(size: 20, weight: .bold)).foregroundColor(Color.white)
                                        .lineLimit(nil)
                                        .truncationMode(.tail)
                                        .frame(maxWidth: (50+scrollPosition.x-14), maxHeight: 40)
                                }.background(.black)
                            }
                            Spacer()
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                    
                    ScrollView {
                        HStack {
                            LazyVGrid (columns: pinterestColumn) {
                                ForEach((mappedImages["left"] ?? [])!, id: \.self) { leftItem in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.1)
                                            .frame(width: 169)
                                        Image(leftItem.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 110)
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
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 110)
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
                        .padding(.horizontal, -14)
                }.padding(.horizontal, 14).padding(.top, 20)
                    .background(Color.black)
        }
        .sheet(isPresented: $isClothClicked) {
            RecommendationBottomSheetView(isPreviewShowed: $isClothClicked, selectedItem: $selectedStyle)
        }
        .sheet(isPresented: $isFilterClicked) {
            RecommendationFilterView(chooseOccations: $occationPicks, choosePieces: $piecePicks, chooseColors: $colorPicks, isFilterAppear: $isFilterClicked)
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
