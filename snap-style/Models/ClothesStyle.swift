//
//  ClothesStyle.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 27/06/23.
//

import Foundation

struct ClothesStyle: Identifiable {
    var id : UUID
    var bodyShape: [BodyShape]
    var name: String
    var description: String?
    var gender : Gender
    var colors : [String]
    var occation : [String]
    var type : String
    var image : String
    var isFavorite : Bool
}
