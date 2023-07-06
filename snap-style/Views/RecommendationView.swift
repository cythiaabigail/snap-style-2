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
    @State var scrollPosition : CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State var occationPicks : [String] = []
    @State var piecePicks : [String] = []
    @State var colorPicks : [String] = []
    @State var isClothClicked : Bool = false
    @State var selectedStyle : ClothesStyle?
    @State var isFilterClicked : Bool = false

    let listBodyShape = BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)
    
    let listStyle = [ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto1", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto2", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto3", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
                     ClothesStyle(id: UUID(), bodyShape: [BodyShape(id: UUID(), name: "Trapezoid", description: "", image: "", gender: Gender.man)], name: "baju renang", gender: Gender.man, colors: ["red"], occation: ["formal"], type: "set", image: "DummyPhoto4", isFavorite: false),
    ]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let pinterestColoum = [
        GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { screenSize in
            NavigationStack {
                VStack {
                    HStack {
                        Text("Styles For You").font(.system(.largeTitle, weight: .bold)).foregroundColor(Color.white)
                        Spacer()
                        Image(systemName: "heart").resizable().frame(width: 24.44, height: 22.41).foregroundColor(Color.white)
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
                                        }
                                    }
                                }
                            }.padding(.top, 10)
                        }.padding(.top, 5)
                    }.frame(maxWidth: .infinity)
                        .background(Color.white)
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
        }
        .sheet(isPresented: $isClothClicked) {
            RecommendationBottomSheetView(isPreviewShowed: $isClothClicked)
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
