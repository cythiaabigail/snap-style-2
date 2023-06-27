//
//  BodyShape.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 27/06/23.
//

import Foundation

struct BodyShape: Identifiable {
    var id : UUID
    var name : String
    var description : String
    var image : String
    var gender : Gender
}

enum Gender {
    case woman
    case man
}
