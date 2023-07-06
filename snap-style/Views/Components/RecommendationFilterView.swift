//
//  RecommendationFilterView.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 02/07/23.
//

import SwiftUI

struct RecommendationFilterView: View {
    @Binding var chooseOccations : [String]
    @Binding var choosePieces : [String]
    @Binding var chooseColors : [String]
    @Binding var isFilterAppear : Bool
    @State var isFilterReseted : Bool = false
    @State var onFilterValueChanged: Bool = false
    let occationPickers : [String] = ["Formal", "Semi Formal", "Casual"]
    let piecePickers : [String] = ["Outter", "Pants", "Full"]
    let colorPickers : [String] = ["Red", "Green", "Blue"]
    let gridState : [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                HStack {
                    Text("Filter").font(.system(size: 30, weight: .bold))
                    Spacer()
                    Button {
                        chooseColors = []
                        choosePieces = []
                        chooseOccations = []
                        isFilterReseted = false
                    } label: {
                        Text("Reset")
                            .foregroundColor(Color("yellow"))
                            .bold()
                            .opacity(isFilterReseted ? 1.0 : 0.3)
                    }.disabled(!isFilterReseted)
                }.padding(.bottom, 24)
                
                Group {
                    
                }
                
                Text("Occasion")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyHGrid(rows: gridState) {
                    ForEach(occationPickers, id: \.self) { occation in
                        Button {
                            if chooseOccations.contains(occation) {
                                chooseOccations
                                    .removeAll(where: {$0 == occation})
                            } else {
                                chooseOccations.append(occation)
                            }
                        } label: {
                            Text("\(occation)")
                                .font(.system(size: 13))
                                .padding(5)
                                .foregroundColor(chooseOccations.contains(occation) ? .white : .gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(chooseOccations.contains(occation) ? .white : .gray, lineWidth: 1)
                                )
                                .padding(2)
                                .background(chooseOccations.contains(occation) ? .gray : .white)
                                .cornerRadius(4)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 24    )
                
                Text("Pieces")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyHGrid(rows: gridState) {
                    ForEach(piecePickers, id: \.self) { occation in
                        Button {
                            if choosePieces.contains(occation) {
                                choosePieces
                                    .removeAll(where: {$0 == occation})
                            } else {
                                choosePieces.append(occation)
                            }
                        } label: {
                            Text("\(occation)")
                                .font(.system(size: 13))
                                .padding(5)
                                .foregroundColor(choosePieces.contains(occation) ? .white : .gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(choosePieces.contains(occation) ? .white : .gray, lineWidth: 1)
                                )
                                .padding(2)
                                .background(choosePieces.contains(occation) ? .gray : .white)
                                .cornerRadius(4)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 24)
                
                Text("Colors")
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridState) {
                        ForEach(colorPickers, id: \.self) { color in
                            Button {
                                if chooseColors.contains(color) {
                                    chooseColors
                                        .removeAll(where: {$0 == color})
                                } else {
                                    chooseColors.append(color)
                                }
                            } label: {
                                Text("\(color)")
                                    .font(.system(size: 13))
                                    .padding(5)
                                    .foregroundColor(chooseColors.contains(color) ? .white : .gray)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(chooseColors.contains(color) ? .white : .gray, lineWidth: 1)
                                    )
                                    .padding(2)
                                    .background(chooseColors.contains(color) ? .gray : .white)
                                    .cornerRadius(4)
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }.scrollIndicators(.hidden)
                
                if onFilterValueChanged {
                    Button {
                        isFilterAppear.toggle()
                    } label: {
                        Text("Apply")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 12))
                            .padding(.vertical, 5.5)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(4)
                            .padding(.top, 31)
//                            .padding(.bottom, 24)
                    }
                }
            }.padding(.horizontal, 24)
                .padding(.top, 42)
                .onChange(of: chooseOccations) { _ in
                    onFilterValueChanged.toggle()
                    if chooseOccations.count != 0 {
                        isFilterReseted = true
                    } else {
                        isFilterReseted = false
                    }
                }
                .onChange(of: choosePieces) { _ in
                    onFilterValueChanged.toggle()
                    if choosePieces.count != 0 {
                        isFilterReseted = true
                    } else {
                        isFilterReseted = false
                    }
                }
                .onChange(of: chooseColors) { _ in
                    onFilterValueChanged.toggle()
                    if chooseColors.count != 0 {
                        isFilterReseted = true
                    } else {
                        isFilterReseted = false
                    }
                }
        }.padding(.bottom, 24)
    }
}

struct RecommendationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationFilterView(chooseOccations: .constant([]), choosePieces: .constant([]), chooseColors: .constant([]), isFilterAppear: .constant(true))
    }
}
