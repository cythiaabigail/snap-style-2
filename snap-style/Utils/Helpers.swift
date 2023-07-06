//
//  Helper.swift
//  snap-style
//
//  Created by David Mahbubi on 06/07/23.
//

import Foundation

func getBodyShapes() -> [BodyShape]? {
    if let fileURL = Bundle.main.url(forResource: "bodyshape", withExtension: "json") {
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let bodyShape = try decoder.decode([BodyShape].self, from: jsonData)
            return bodyShape
        } catch {
            print("Error decoding JSON : \(error)")
        }
    }
    return nil
}
